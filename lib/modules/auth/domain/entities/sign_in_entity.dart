class SignInEntity {
  final String? accessToken;
  final dynamic refreshToken;
  final String? identifier;
  final String? password;
  final String? message;

  SignInEntity(
    this.accessToken,
    this.refreshToken,
    this.identifier,
    this.password,
    this.message,
  );
}
