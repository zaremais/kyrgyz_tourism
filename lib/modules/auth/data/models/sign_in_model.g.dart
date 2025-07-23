// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInModel _$SignInModelFromJson(Map json) => SignInModel(
  json['accessToken'] as String?,
  json['refreshToken'] as String?,
  json['identifier'] as String?,
  json['password'] as String?,
  json['message'] as String?,
);

Map<String, dynamic> _$SignInModelToJson(SignInModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'identifier': instance.identifier,
      'password': instance.password,
      'message': instance.message,
    };
