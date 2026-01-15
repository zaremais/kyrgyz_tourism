import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/config/environment.dart';
import 'package:kyrgyz_tourism/core/network/storage_secure_storage/secure_storage.dart';
import 'package:kyrgyz_tourism/core/utils/logger.dart';

@injectable
class AuthInterceptor extends Interceptor {
  final Dio _refreshDio;
  bool _isRefreshing = false;

  AuthInterceptor()
    : _refreshDio = Dio(BaseOptions(baseUrl: AppConfig.baseUrl));

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
   
    final token = await SecureStorage().getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    AppLogger.logRequest(
      options.method,
      options.uri.toString(),
      data: options.data,
      headers: options.headers,
    );

    handler.next(options);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    AppLogger.logResponse(
      response.requestOptions.method,
      response.requestOptions.uri.toString(),
      response.statusCode ?? 0,
      data: response.data,
    );

    handler.next(response);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    AppLogger.error(
      'Network error: ${err.message}',
      tag: 'AUTH_INTERCEPTOR',
      data: {
        'url': err.requestOptions.uri.toString(),
        'statusCode': err.response?.statusCode,
        'response': err.response?.data,
      },
    );

    if (err.response?.statusCode == 401 && !_isRefreshing) {
      _isRefreshing = true;

      try {
        final newToken = await _refreshToken();
        err.requestOptions.headers['Authorization'] = 'Bearer $newToken';
        final response = await _refreshDio.fetch(err.requestOptions);
        handler.resolve(response);
      } catch (e) {
        AppLogger.error(
          'Token refresh failed',
          tag: 'AUTH_INTERCEPTOR',
          data: e,
        );
        await SecureStorage().clearTokens();
        handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: 'Session expired. Please login again',
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
    final refreshToken = await SecureStorage().getRefreshToken();
    if (refreshToken == null) {
      throw Exception('No refresh token available');
    }

    final response = await _refreshDio.post(
      '/v1/api/verify/refresh',
      data: {'refreshToken': refreshToken},
    );

    if (response.statusCode == 200) {
      final newToken = response.data['accessToken'] as String;
      await SecureStorage().saveAccessToken(newToken);
      return newToken;
    }

    throw Exception('Failed to refresh token: ${response.statusCode}');
  }
}
