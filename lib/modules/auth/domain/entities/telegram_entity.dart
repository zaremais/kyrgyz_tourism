class TelegramEntity {
  final String? rawPassword;
  final String username;
  final String? refreshToken;
  final String? accessToken;
  final bool? isVerified;
  final String phoneNumber;
  final String otp;
  final int? chatId;
  final String? url;

  TelegramEntity({
    this.rawPassword,
    required this.username,
    this.refreshToken,
    this.accessToken,
    this.isVerified,
    required this.phoneNumber,
    required this.otp,
    this.chatId,
    this.url,
  });
}
