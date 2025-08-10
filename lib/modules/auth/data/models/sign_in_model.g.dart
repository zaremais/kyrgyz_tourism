// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInModel _$SignInModelFromJson(Map json) => SignInModel(
  accessToken: json['accessToken'] as String,
  refreshToken: json['refreshToken'] as String,
  identifier: json['identifier'] as String?,
  password: json['password'] as String?,
  message: json['message'] as String?,
);

Map<String, dynamic> _$SignInModelToJson(SignInModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'identifier': instance.identifier,
      'password': instance.password,
      'message': instance.message,
    };
