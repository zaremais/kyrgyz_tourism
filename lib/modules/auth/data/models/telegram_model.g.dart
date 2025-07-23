// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telegram_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TelegramModel _$TelegramModelFromJson(Map json) => TelegramModel(
  username: json['username'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  rawPassword: json['rawPassword'] as String?,
  refreshToken: json['refreshToken'] as String?,
  accessToken: json['accessToken'] as String?,
  otp: json['otp'] as String?,
  chatId: (json['chatId'] as num?)?.toInt(),
);

Map<String, dynamic> _$TelegramModelToJson(TelegramModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'phoneNumber': instance.phoneNumber,
      'rawPassword': instance.rawPassword,
      'refreshToken': instance.refreshToken,
      'accessToken': instance.accessToken,
      'otp': instance.otp,
      'chatId': instance.chatId,
    };
