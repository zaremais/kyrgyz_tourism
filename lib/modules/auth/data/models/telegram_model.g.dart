// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telegram_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TelegramModel _$TelegramModelFromJson(Map<String, dynamic> json) =>
    TelegramModel(
      phoneNumber: json['phoneNumber'] as String,
      otpCode: json['otpCode'] as String,
      chatId: json['chatId'] as String,
      isVerified: json['isVerified'] as bool,
    );

Map<String, dynamic> _$TelegramModelToJson(TelegramModel instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'otpCode': instance.otpCode,
      'chatId': instance.chatId,
      'isVerified': instance.isVerified,
    };
