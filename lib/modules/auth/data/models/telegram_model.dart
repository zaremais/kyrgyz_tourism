import 'package:json_annotation/json_annotation.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/telegram_entity.dart';

part 'telegram_model.g.dart';

@JsonSerializable()
class TelegramModel extends TelegramEntity {
  TelegramModel({
    required super.phoneNumber,
    required super.otpCode,
    required super.chatId,
    required super.isVerified,
  });

  factory TelegramModel.fromJson(JSON json) => _$TelegramModelFromJson(json);
  JSON toJson() => _$TelegramModelToJson(this);
}
