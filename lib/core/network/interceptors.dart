import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoggerInterceptor extends Interceptor {
  final Dio _refreshDio = Dio(BaseOptions(baseUrl: 'http://34.18.76.114'));

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    log('${options.method} request ==> ${options.uri}');

    options.headers.addAll({
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
      if (token != null) 'Authorization': 'Bearer $token',
    });

    handler.next(options);
  }

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) async {
    if (error.response?.statusCode == 403) {
      try {
        final prefs = await SharedPreferences.getInstance();
        final refreshToken = prefs.getString('refreshToken');

        if (refreshToken != null) {
          final response = await _refreshDio.post(
            '/v1/api/refresh',
            data: {'refreshToken': refreshToken},
          );

          if (response.statusCode == 200) {
            final newToken = response.data['accessToken'];
            await prefs.setString('token', newToken);

            final opts = error.requestOptions;
            opts.headers['Authorization'] = 'Bearer $newToken';
            final retry = await _refreshDio.fetch(opts);
            return handler.resolve(retry);
          }
        }
      } catch (e) {
        log('Token refresh failed: $e');
      }

      // await prefs.remove('token');
      // await prefs.remove('refreshToken');
    }

    handler.next(error);
  }
}
