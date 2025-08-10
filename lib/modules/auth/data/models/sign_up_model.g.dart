// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpModel _$SignUpModelFromJson(Map json) => SignUpModel(
  email: json['email'] as String?,
  nickaname: json['nickaname'] as String?,
  password: json['password'] as String?,
  message: json['message'] as String?,
  success: json['success'] as bool?,
);

Map<String, dynamic> _$SignUpModelToJson(SignUpModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'nickaname': instance.nickaname,
      'password': instance.password,
      'message': instance.message,
      'success': instance.success,
    };
