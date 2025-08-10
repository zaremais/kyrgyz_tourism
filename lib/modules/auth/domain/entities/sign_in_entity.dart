class SignInEntity {
  final String accessToken;
  final String refreshToken;
  final String? identifier;
  final String? password;
  final String? message;

  SignInEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.identifier,
    required this.password,
    required this.message,
  });
}
