class ChatEntity {
  final String message;
  final DateTime timestamp;
  final bool isFromUser;
  final String? suggestedReplies;

  ChatEntity({
    required this.message,
    required this.timestamp,
    required this.isFromUser,
    required this.suggestedReplies,
  });
}
