class TelegramOtpEntity {
  final String username;
  final String rawPassword;
  final String otp;
  final String? phoneNumber;
  final int? chatId;

  TelegramOtpEntity({
    required this.username,
    required this.rawPassword,
    required this.otp,
    required this.phoneNumber,
    required this.chatId,
  });
}
