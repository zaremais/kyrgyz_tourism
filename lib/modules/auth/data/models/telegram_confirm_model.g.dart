// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telegram_confirm_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TelegramConfirmModel _$TelegramConfirmModelFromJson(Map json) =>
    TelegramConfirmModel(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      chatId: (json['chatId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TelegramConfirmModelToJson(
  TelegramConfirmModel instance,
) => <String, dynamic>{
  'accessToken': instance.accessToken,
  'refreshToken': instance.refreshToken,
  'chatId': instance.chatId,
};
