// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telegram_otp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TelegramOtpModel _$TelegramOtpModelFromJson(Map json) => TelegramOtpModel(
  username: json['username'] as String? ?? '',
  rawPassword: json['rawPassword'] as String? ?? '',
  otp: json['otp'] as String? ?? '',
  phoneNumber: json['phoneNumber'] as String? ?? '',
  chatId: (json['chatId'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$TelegramOtpModelToJson(TelegramOtpModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'rawPassword': instance.rawPassword,
      'otp': instance.otp,
      'phoneNumber': instance.phoneNumber,
      'chatId': instance.chatId,
    };
