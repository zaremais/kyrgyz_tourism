import 'package:json_annotation/json_annotation.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';

import 'package:kyrgyz_tourism/features/auth/domain/entities/telegram_otp_entity.dart';

part 'telegram_otp_model.g.dart';

@JsonSerializable(createFactory: true, createToJson: true)
class TelegramOtpModel extends TelegramOtpEntity {
  TelegramOtpModel({
    required super.username,
    required super.rawPassword,
    required super.otp,
  });

  factory TelegramOtpModel.fromJson(JSON json) =>
      _$TelegramOtpModelFromJson(json);
  JSON toJson() => _$TelegramOtpModelToJson(this);
}
