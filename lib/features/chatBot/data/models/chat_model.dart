import 'package:json_annotation/json_annotation.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/features/chatBot/domain/entities/chat_entity.dart';

part 'chat_model.g.dart';

@JsonSerializable()
class ChatModel extends ChatEntity {
  ChatModel({
    required super.message,
    required super.timestamp,
    required super.isFromUser,
    required super.suggestedReplies,
  });

  factory ChatModel.fromJson(JSON json) => _$ChatModelFromJson(json);

  JSON toJson() => _$ChatModelToJson(this);
}
