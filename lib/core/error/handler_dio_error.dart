import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ErrorHandler {
  static Never handleDioError(DioException e) {
    String message = 'Произошла ошибка запроса';

    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      message = 'Превышено время ожидания запроса';
    } else if (e.type == DioExceptionType.badResponse) {
      final statusCode = e.response?.statusCode ?? 0;
      final responseData = e.response?.data;

      switch (statusCode) {
        case 400:
          message = 'Неверные данные (400)';
          break;
        case 401:
          message = 'Вы не авторизованы (401)';
          break;
        case 403:
          message = 'Доступ запрещён (403)';
          break;
        case 404:
          message = 'Ресурс не найден (404)';
          break;
        case 500:
          message = 'Ошибка сервера (500)';
          break;
        default:
          message = 'Неизвестная ошибка: $statusCode';
      }

      if (responseData is Map && responseData['message'] != null) {
        message += '\n${responseData['message']}';
      }
    } else if (e.type == DioExceptionType.cancel) {
      message = 'Запрос был отменён';
    } else if (e.type == DioExceptionType.unknown &&
        e.error is SocketException) {
      message = 'Нет подключения к интернету';
    }

    if (kDebugMode) {
      log(
        'Dio Error:\n'
        'Type: ${e.type}\n'
        'Message: $message\n'
        'Status Code: ${e.response?.statusCode}\n'
        'Data: ${e.response?.data}',
      );
    }

    throw Exception(message);
  }
}
