import 'package:json_annotation/json_annotation.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/telegram_entity.dart';

part 'telegram_model.g.dart';

@JsonSerializable()
class TelegramModel extends TelegramEntity {
  TelegramModel({
    super.rawPassword,
    required super.username,
    super.refreshToken,
    super.accessToken,
    super.isVerified,
    required super.phoneNumber,
    required super.otp,
    super.chatId,
    super.url,
  });

  factory TelegramModel.fromJson(JSON json, {required String url}) =>
      _$TelegramModelFromJson(json);
  JSON toJson() => _$TelegramModelToJson(this);
}
