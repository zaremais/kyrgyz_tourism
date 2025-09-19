// import 'package:equatable/equatable.dart';

// abstract class Failure extends Equatable {
//   final String message;
//   final int? code;
//   final dynamic details;

//   const Failure({required this.message, this.code, this.details});

//   @override
//   List<Object?> get props => [message, code, details];

//   @override
//   String toString() =>
//       'Failure(message: $message, code: $code, details: $details)';
// }

// class NetworkFailure extends Failure {
//   const NetworkFailure({required super.message, super.code, super.details});

//   factory NetworkFailure.noInternet() =>
//       const NetworkFailure(message: 'Нет подключения к интернету', code: 0);

//   factory NetworkFailure.timeout() =>
//       const NetworkFailure(message: 'Превышено время ожидания', code: 408);

//   factory NetworkFailure.serverError(int? code) =>
//       NetworkFailure(message: 'Ошибка сервера', code: code);
// }

// class AuthFailure extends Failure {
//   const AuthFailure({required super.message, super.code, super.details});

//   factory AuthFailure.unauthorized() =>
//       const AuthFailure(message: 'Необходима авторизация', code: 401);

//   factory AuthFailure.forbidden() =>
//       const AuthFailure(message: 'Доступ запрещен', code: 403);

//   factory AuthFailure.invalidCredentials() =>
//       const AuthFailure(message: 'Неверные учетные данные', code: 401);

//   factory AuthFailure.tokenExpired() =>
//       const AuthFailure(message: 'Токен истек', code: 401);
// }

// class ValidationFailure extends Failure {
//   const ValidationFailure({required super.message, super.code, super.details});

//   factory ValidationFailure.invalidEmail() =>
//       const ValidationFailure(message: 'Неверный формат email');

//   factory ValidationFailure.weakPassword() =>
//       const ValidationFailure(message: 'Пароль слишком слабый');

//   factory ValidationFailure.requiredField(String field) =>
//       ValidationFailure(message: 'Поле "$field" обязательно для заполнения');
// }

// /// Cache/storage failures
// class CacheFailure extends Failure {
//   const CacheFailure({required super.message, super.code, super.details});

//   factory CacheFailure.notFound() =>
//       const CacheFailure(message: 'Данные не найдены в кэше');

//   factory CacheFailure.saveError() =>
//       const CacheFailure(message: 'Ошибка сохранения данных');
// }

// /// Unknown/unexpected failures
// class UnknownFailure extends Failure {
//   const UnknownFailure({required super.message, super.code, super.details});

//   factory UnknownFailure.unexpected() =>
//       const UnknownFailure(message: 'Произошла неожиданная ошибка');
// }
