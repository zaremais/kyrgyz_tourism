import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException({required this.message, this.statusCode});

  factory ApiException.fromDioError(DioException error) {
    return ApiException(
      message: error.message ?? 'Ошибка сети',
      statusCode: error.response?.statusCode,
    );
  }
}

class SessionExpiredException extends ApiException {
  SessionExpiredException()
    : super(message: 'Сессия истекла. Требуется вход.', statusCode: 401);
}

String extractErrorMessage(dynamic responseData, int? statusCode) {
  if (responseData == null) return 'Неизвестная ошибка';
  final responseText = responseData.toString().toLowerCase();
  if (responseText.contains('email already exists')) {
    return 'Пользователь с таким email уже существует';
  } else if (responseText.contains('nickname already exists')) {
    return 'Пользователь с таким никнеймом уже существует';
  }
  return responseData.toString();
}
