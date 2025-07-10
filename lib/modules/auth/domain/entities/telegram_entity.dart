class TelegramEntity {
  final String rawPassword;
  final String username;
  final String refreshToken;
  final String accessToken;
  final bool isVerified;
  final String phoneNumber;
  final String otp;
  final int chatId;

  TelegramEntity({
    required this.rawPassword,
    required this.username,
    required this.refreshToken,
    required this.accessToken,
    required this.isVerified,
    required this.phoneNumber,
    required this.otp,
    required this.chatId,
  });
}
