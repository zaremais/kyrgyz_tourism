import 'package:dio/dio.dart';
import 'package:kyrgyz_tourism/core/network/storage_secure_storage/storage_secure_service.dart';

class AuthInterceptor extends Interceptor {
  final Dio _refreshDio;
  bool _isRefreshing = false;
  // final List<RequestOptions> _pendingRequests = [];

  AuthInterceptor()
    : _refreshDio = Dio(BaseOptions(baseUrl: 'http://34.18.76.114'));

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers.addAll({
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    });

    final token = await SecureStorage().getAccessToken();
    if (token != null) {
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
        final newToken = await _refreshToken();

        err.requestOptions.headers['Authorization'] = 'Bearer $newToken';
        final response = await _refreshDio.fetch(err.requestOptions);

        handler.resolve(response);
      } catch (e) {
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
    final response = await _refreshDio.post(
      '/v1/api/auth/refresh',
      data: {'refreshToken': refreshToken},
    );

    if (response.statusCode == 200) {
      final newToken = response.data['accessToken'] as String;
      await SecureStorage().saveAccessToken(newToken);
      return newToken;
    }

    throw Exception('Failed to refresh token');
  }
}

// class LoggerInterceptor extends Interceptor {
//   final Dio _refreshDio = Dio(BaseOptions(baseUrl: 'http://34.18.76.114'));

//   @override
//   void onRequest(
//     RequestOptions options,
//     RequestInterceptorHandler handler,
//   ) async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token');

//     log('${options.method} request ==> ${options.uri}');

//     options.headers.addAll({
//       'Accept': 'application/json',
//       'Content-Type': 'application/json; charset=UTF-8',
//       if (token != null) 'Authorization': 'Bearer $token',
//     });

//     handler.next(options);
//   }

//   @override
//   void onError(DioException error, ErrorInterceptorHandler handler) async {
//     if (error.response?.statusCode == 403) {
//       try {
//         final prefs = await SharedPreferences.getInstance();
//         final refreshToken = prefs.getString('refreshToken');

//         if (refreshToken != null) {
//           final response = await _refreshDio.post(
//             '/v1/api/refresh',
//             data: {'refreshToken': refreshToken},
//           );

//           if (response.statusCode == 200) {
//             final newToken = response.data['accessToken'];
//             await prefs.setString('token', newToken);

//             final opts = error.requestOptions;
//             opts.headers['Authorization'] = 'Bearer $newToken';
//             final retry = await _refreshDio.fetch(opts);
//             return handler.resolve(retry);
//           }
//         }
//       } catch (e) {
//         log('Token refresh failed: $e');
//       }

//       // await prefs.remove('token');
//       // await prefs.remove('refreshToken');
//     }

//     handler.next(error);
//   }
// }
