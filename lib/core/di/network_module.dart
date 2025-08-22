import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/constants/api_urls.dart';
import 'package:kyrgyz_tourism/core/interceptors/auth_interceptors.dart';

@module
abstract class NetworkModule {
  @Named('BaseUrl')
  String get baseUrl => ApiUrls.baseUrl;

  @lazySingleton
  Dio provideDio(
    AuthInterceptor authInterceptor,
    @Named('BaseUrl') String baseUrl,
  ) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        validateStatus: (status) => status != null && status < 500,
        headers: {'Content-Type': 'application/json', 'accept': '*/*'},
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        responseType: ResponseType.json,
      ),
    );
    dio.interceptors.add(authInterceptor);
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    return dio;
  }
}
