import 'package:dio/dio.dart';
import 'package:kyrgyz_tourism/core/error/failure.dart';
import 'package:kyrgyz_tourism/core/config/environment.dart';

class ErrorHandler {
  static Failure handleError(dynamic error) {
    if (error is DioException) {
      return _handleDioError(error);
    } else if (error is Failure) {
      return error;
    } else {
      return UnknownFailure.unexpected();
    }
  }

  static Failure _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkFailure.timeout();

      case DioExceptionType.connectionError:
        return NetworkFailure.noInternet();

      case DioExceptionType.badResponse:
        return _handleResponseError(error);

      case DioExceptionType.cancel:
        return NetworkFailure(message: 'Запрос был отменен', code: -1);

      case DioExceptionType.unknown:
      default:
        return UnknownFailure.unexpected();
    }
  }

  static Failure _handleResponseError(DioException error) {
    final statusCode = error.response?.statusCode;
    final data = error.response?.data;

    switch (statusCode) {
      case 400:
        return ValidationFailure(
          message: _extractErrorMessage(data) ?? 'Неверный запрос',
          code: statusCode,
        );

      case 401:
        return AuthFailure.unauthorized();

      case 403:
        return AuthFailure.forbidden();

      case 404:
        return NetworkFailure(message: 'Ресурс не найден', code: statusCode);

      case 408:
        return NetworkFailure.timeout();

      case 500:
      case 502:
      case 503:
      case 504:
        return NetworkFailure.serverError(statusCode);

      default:
        return NetworkFailure(
          message: _extractErrorMessage(data) ?? 'Ошибка сервера',
          code: statusCode,
        );
    }
  }

  static String? _extractErrorMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data['message'] ?? data['error'] ?? data['detail'];
    } else if (data is String) {
      return data;
    }
    return null;
  }

  static void logError(Failure failure, {String? context}) {
    if (AppConfig.enableLogging) {
      final contextStr = context != null ? '[$context] ' : '';
      print('${contextStr}Error: ${failure.message} (Code: ${failure.code})');
      if (failure.details != null) {
        print('Details: ${failure.details}');
      }
    }
  }
}
