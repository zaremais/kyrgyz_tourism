import 'package:json_annotation/json_annotation.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/telegram_confirm_entity.dart';

part 'telegram_confirm_model.g.dart';

@JsonSerializable()
class TelegramConfirmModel extends TelegramConfirmEntity {
  TelegramConfirmModel({
    required super.accessToken,
    required super.refreshToken,
  });

  factory TelegramConfirmModel.fromJson(JSON json) =>
      _$TelegramConfirmModelFromJson(json);
  JSON toJson() => _$TelegramConfirmModelToJson(this);
}
