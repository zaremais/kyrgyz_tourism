import 'package:json_annotation/json_annotation.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/telegram_entity.dart';

part 'telegram_model.g.dart';

@JsonSerializable()
class TelegramModel extends TelegramEntity {
  TelegramModel({
    required super.rawPassword,
    required super.username,
    required super.refreshToken,
    required super.accessToken,
    required super.isVerified,
    required super.phoneNumber,
    required super.otp,
    required super.chatId,
  });

  factory TelegramModel.fromJson(JSON json) => _$TelegramModelFromJson(json);
  JSON toJson() => _$TelegramModelToJson(this);
}
