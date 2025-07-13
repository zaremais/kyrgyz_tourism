// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telegram_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TelegramModel _$TelegramModelFromJson(Map<String, dynamic> json) =>
    TelegramModel(
      rawPassword: json['rawPassword'] as String?,
      username: json['username'] as String,
      refreshToken: json['refreshToken'] as String?,
      accessToken: json['accessToken'] as String?,
      isVerified: json['isVerified'] as bool?,
      phoneNumber: json['phoneNumber'] as String,
      otp: json['otp'] as String,
      chatId: (json['chatId'] as num?)?.toInt(),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$TelegramModelToJson(TelegramModel instance) =>
    <String, dynamic>{
      'rawPassword': instance.rawPassword,
      'username': instance.username,
      'refreshToken': instance.refreshToken,
      'accessToken': instance.accessToken,
      'isVerified': instance.isVerified,
      'phoneNumber': instance.phoneNumber,
      'otp': instance.otp,
      'chatId': instance.chatId,
      'url': instance.url,
    };
