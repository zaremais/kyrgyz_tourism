// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatModel _$ChatModelFromJson(Map json) => ChatModel(
  message: json['message'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
  isFromUser: json['isFromUser'] as bool,
  suggestedReplies: json['suggestedReplies'] as String?,
);

Map<String, dynamic> _$ChatModelToJson(ChatModel instance) => <String, dynamic>{
  'message': instance.message,
  'timestamp': instance.timestamp.toIso8601String(),
  'isFromUser': instance.isFromUser,
  'suggestedReplies': instance.suggestedReplies,
};
