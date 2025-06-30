class TelegramEntity {
  final String phoneNumber;

  final String otpCode;

  final String chatId;

  final bool isVerified;

  TelegramEntity({
    required this.isVerified,
    required this.phoneNumber,
    required this.otpCode,
    required this.chatId,
  });
}
