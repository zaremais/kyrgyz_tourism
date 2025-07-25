import 'package:dio/dio.dart';
import 'package:kyrgyz_tourism/core/network/storage_secure_storage/token_storage_service.dart';

class AuthInterceptor extends Interceptor {
  final Dio _refreshDio;
  final TokenStorageService _tokenStorage = TokenStorageService();
  bool _isRefreshing = false;

  AuthInterceptor()
    : _refreshDio = Dio(BaseOptions(baseUrl: 'http://34.18.76.114'));

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _tokenStorage.getAccessToken();

    options.headers.addAll({
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    });

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 403 && !_isRefreshing) {
      _isRefreshing = true;

      try {
        final newAccessToken = await _refreshToken();

        // Повтор запроса с новым токеном
        err.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
        final response = await _refreshDio.fetch(err.requestOptions);
        handler.resolve(response);
      } catch (e) {
        await _tokenStorage.clearTokens();
        handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: 'Сессия истекла. Авторизуйтесь снова.',
          ),
        );
      } finally {
        _isRefreshing = false;
      }
    } else {
      handler.next(err);
    }
  }

  Future<String> _refreshToken() async {
    final refreshToken = await _tokenStorage.getRefreshToken();

    if (refreshToken == null || refreshToken.isEmpty) {
      throw Exception('Refresh token отсутствует');
    }

    final response = await _refreshDio.post(
      '/v1/api/auth/refresh',
      data: {'refreshToken': refreshToken},
    );

    if (response.statusCode == 200 && response.data['accessToken'] != null) {
      final newAccessToken = response.data['accessToken'];
      await _tokenStorage.saveAccessToken(newAccessToken);
      return newAccessToken;
    } else {
      throw Exception('Ошибка обновления токена');
    }
  }
}
