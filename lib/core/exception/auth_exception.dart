class AppException implements Exception {
  final int? code;
  final String message;
  final dynamic details;

  AppException({this.code, required this.message, this.details});

  @override
  String toString() => '[${code ?? "ERR"}] $message';
}

class AuthException implements Exception {
  final String message;
  final int? code;

  const AuthException(this.message, {this.code});

  factory AuthException.forbidden() =>
      const AuthException('Доступ запрещен. Требуется авторизация', code: 403);

  factory AuthException.network(String message) =>
      AuthException('Ошибка сети: $message');

  factory AuthException.unknown() => const AuthException('Неизвестная ошибка');

  @override
  String toString() =>
      '[AuthException] $message${code != null ? ' ($code)' : ''}';
}
