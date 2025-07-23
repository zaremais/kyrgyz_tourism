// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpModel _$SignUpModelFromJson(Map json) => SignUpModel(
  email: json['email'] as String?,
  nickname: json['nickname'] as String?,
  password: json['password'] as String?,
);

Map<String, dynamic> _$SignUpModelToJson(SignUpModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'nickname': instance.nickname,
      'password': instance.password,
    };
