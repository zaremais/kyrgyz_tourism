// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map json) => UserModel(
  id: (json['id'] as num?)?.toInt(),
  email: json['email'] as String?,
  userName: json['userName'] as String?,
  phone: json['phone'] as String?,
  code: json['code'] as String?,
  password: json['password'] as String?,
  message: json['message'] as String?,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'userName': instance.userName,
  'phone': instance.phone,
  'code': instance.code,
  'password': instance.password,
  'message': instance.message,
};
