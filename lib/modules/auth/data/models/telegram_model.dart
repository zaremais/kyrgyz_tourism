import 'package:json_annotation/json_annotation.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/telegram_entity.dart';

part 'telegram_model.g.dart';

@JsonSerializable(createFactory: true, createToJson: true)
class TelegramModel extends TelegramEntity {
  TelegramModel({
    String? username,
    String? phoneNumber,
    String? rawPassword,
    String? refreshToken,
    String? accessToken,
    String? otp,
    int? chatId,
  }) : super(
         username: username ?? '',
         phoneNumber: phoneNumber ?? '',
         rawPassword: rawPassword ?? '',
         refreshToken: refreshToken ?? '',
         accessToken: accessToken ?? '',
         otp: otp ?? '',
         chatId: chatId ?? 0,
       );
  factory TelegramModel.fromJson(Map<String, dynamic> json) =>
      _$TelegramModelFromJson(json);

  Map<String, dynamic> toJson() => _$TelegramModelToJson(this);
}
