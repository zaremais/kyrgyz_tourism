import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/constants/api_urls.dart';
import 'package:kyrgyz_tourism/core/network/storage_secure_storage/token_storage_service.dart';

@injectable
class AuthInterceptor extends Interceptor {
  final Dio _refreshDio;
  final TokenStorageService _tokenStorage = TokenStorageService();
  bool _isRefreshing = false;

  AuthInterceptor() : _refreshDio = Dio(BaseOptions(baseUrl: ApiUrls.baseUrl));

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers.addAll({});

    final isPublicRoute =
        options.path.contains(ApiUrls.signup) ||
        options.path.contains(ApiUrls.signin);
    if (!isPublicRoute) {
      final token = await _tokenStorage.getAccessToken();
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }

    handler.next(options);

    // bool _isAuthEndpoint(String path) {
    //   return path.contains('/sign-in') ||
    //       path.contains('/sign-up') ||
    //       path.contains('/verify') ||
    //       path.contains('/refresh');
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 && !_isRefreshing) {
      _isRefreshing = true;
      try {
        final rt = await _tokenStorage.getRefreshToken();
        if (rt == null || rt.isEmpty) {
          _isRefreshing = false;
          return handler.next(err);
        }

        final refreshResp = await _refreshDio.post(
          ApiUrls.refreshToken,
          data: {"refreshToken": rt},
          options: Options(headers: {'Content-Type': 'application/json'}),
        );

        final newAccess = refreshResp.data['accessToken'] as String?;
        final newRefresh = refreshResp.data['refreshToken'] as String?;

        if (newAccess == null || newRefresh == null) {
          _isRefreshing = false;
          return handler.next(err);
        }

        await _tokenStorage.saveTokens(
          accessToken: newAccess,
          refreshToken: newRefresh,
        );

        final RequestOptions req = err.requestOptions;
        req.headers['Authorization'] = 'Bearer $newAccess';

        final dio = Dio(BaseOptions(baseUrl: ApiUrls.baseUrl));
        dio.interceptors.add(this);
        final retryResponse = await dio.fetch(req);

        _isRefreshing = false;
        return handler.resolve(retryResponse);
      } catch (e) {
        _isRefreshing = false;
        return handler.next(err);
      }
    }
    return handler.next(err);
  }
}

// import 'dart:async';

// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';
// import 'package:kyrgyz_tourism/core/constants/api_urls.dart';
// import 'package:kyrgyz_tourism/core/network/storage_secure_storage/token_storage_service.dart';
// import 'package:synchronized/synchronized.dart';

// @lazySingleton
// class AuthInterceptor extends Interceptor {
//   final TokenStorageService _tokenStorage;
//   final Dio _refreshDio;
//   final _lock = Lock();
//   bool _isRefreshing = false;
//   final List<Completer<void>> _pendingRequests = [];

//   AuthInterceptor(this._tokenStorage)
//     : _refreshDio = Dio(BaseOptions(baseUrl: ApiUrls.baseUrl));

//   @override
//   Future<void> onRequest(
//     RequestOptions options,
//     RequestInterceptorHandler handler,
//   ) async {
//     if (!_isPublicRoute(options.path)) {
//       final token = await _tokenStorage.getAccessToken();
//       if (token != null) {
//         options.headers['Authorization'] = 'Bearer $token';
//       }
//     }

//     options.headers['Content-Type'] = 'application/json';
//     options.headers['accept'] = '*/*';

//     handler.next(options);
//   }

//   @override
//   Future<void> onError(
//     DioException err,
//     ErrorInterceptorHandler handler,
//   ) async {
//     final statusCode = err.response?.statusCode;
//     final path = err.requestOptions.path;

//     if (path.endsWith('/sign-in')) {
//       return _handleSignInError(err, handler);
//     }

//     if (statusCode == 403 && !_isRefreshing) {
//       return _handleTokenRefresh(err, handler);
//     }

//     if (statusCode == 401) {
//       await _tokenStorage.clearTokens();
//       return handler.reject(
//         DioException(
//           requestOptions: err.requestOptions,
//           error: 'Сессия истекла. Требуется повторный вход',
//         ),
//       );
//     }

//     handler.next(err);
//   }

//   Future<void> _handleSignInError(
//     DioException err,
//     ErrorInterceptorHandler handler,
//   ) async {
//     final statusCode = err.response?.statusCode;

//     if (statusCode == 403) {
//       await _tokenStorage.clearTokens();
//       return handler.reject(
//         DioException(
//           requestOptions: err.requestOptions,
//           error: 'Доступ запрещен. Проверьте учетные данные',
//         ),
//       );
//     }

//     if (statusCode == 401) {
//       return handler.reject(
//         DioException(
//           requestOptions: err.requestOptions,
//           error: 'Неверный логин или пароль',
//         ),
//       );
//     }

//     handler.next(err);
//   }

//   Future<void> _handleTokenRefresh(
//     DioException err,
//     ErrorInterceptorHandler handler,
//   ) async {
//     return _lock.synchronized(() async {
//       if (_isRefreshing) {
//         return _waitForTokenRefresh(err.requestOptions, handler);
//       }

//       _isRefreshing = true;
//       try {
//         final newToken = await _refreshAccessToken();
//         await _retryRequest(err.requestOptions, handler, newToken);
//       } catch (e) {
//         await _tokenStorage.clearTokens();
//         handler.reject(
//           DioException(
//             requestOptions: err.requestOptions,
//             error: 'Ошибка обновления токена. Требуется вход',
//           ),
//         );
//       } finally {
//         _isRefreshing = false;
//         _completePendingRequests();
//       }
//     });
//   }

//   Future<String> _refreshAccessToken() async {
//     final refreshToken = await _tokenStorage.getRefreshToken();
//     if (refreshToken == null) {
//       throw Exception('Refresh token отсутствует');
//     }

//     final response = await _refreshDio.post(
//       '/v1/api/refresh',
//       data: {'refreshToken': refreshToken},
//     );

//     final newAccessToken = response.data['accessToken'] as String;
//     final newRefreshToken = response.data['refreshToken'] as String?;

//     await _tokenStorage.saveTokens(
//       accessToken: newAccessToken,
//       refreshToken: newRefreshToken ?? refreshToken,
//     );

//     return newAccessToken;
//   }

//   Future<void> _waitForTokenRefresh(
//     RequestOptions options,
//     ErrorInterceptorHandler handler,
//   ) async {
//     final completer = Completer<void>();
//     _pendingRequests.add(completer);
//     await completer.future;
//     await _retryRequest(options, handler, null);
//   }

//   Future<void> _retryRequest(
//     RequestOptions options,
//     ErrorInterceptorHandler handler,
//     String? newToken,
//   ) async {
//     try {
//       if (newToken != null) {
//         options.headers['Authorization'] = 'Bearer $newToken';
//       }
//       final response = await _refreshDio.fetch(options);
//       handler.resolve(response);
//     } catch (e) {
//       handler.reject(
//         DioException(
//           requestOptions: options,
//           error: 'Не удалось повторить запрос',
//         ),
//       );
//     }
//   }

//   void _completePendingRequests() {
//     for (final completer in _pendingRequests) {
//       if (!completer.isCompleted) {
//         completer.complete();
//       }
//     }
//     _pendingRequests.clear();
//   }

//   bool _isPublicRoute(String path) {
//     return path.endsWith('/sign-in') || path.endsWith('/refresh');
//   }
// }
