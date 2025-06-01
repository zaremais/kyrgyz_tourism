// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersModel _$UsersModelFromJson(Map<String, dynamic> json) => UsersModel(
  email: json['email'] as String,
  gender: json['gender'] as String,
  picture: json['picture'] as String,
);

Map<String, dynamic> _$UsersModelToJson(UsersModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'gender': instance.gender,
      'picture': instance.picture,
    };
