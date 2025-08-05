class SignUpEntity {
  final String email;
  final String nickaname;
  final String password;
  final String message;
  final bool success;

  SignUpEntity({
    required this.email,
    required this.nickaname,
    required this.password,
    required this.message,
    required this.success,
  });
}
