class TelegramEntity {
  final String username;
  final String phoneNumber;
  final String rawPassword;
  final String refreshToken;
  final String accessToken;
  final String otp;
  final int chatId;

  TelegramEntity({
    required this.username,
    required this.phoneNumber,
    required this.rawPassword,
    required this.refreshToken,
    required this.accessToken,
    required this.otp,
    required this.chatId,
  });
}
