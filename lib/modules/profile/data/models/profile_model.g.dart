// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map json) => ProfileModel(
  fullName: json['fullName'] as String?,
  birthDate: json['birthDate'] as String?,
  lastLogin: json['lastLogin'] as String?,
  workStartDate: json['workStartDate'] as String?,
  description: json['description'] as String?,
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  nickname: json['nickname'] as String,
  email: json['email'] as String,
  image: json['image'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  roles: (json['roles'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'birthDate': instance.birthDate,
      'workStartDate': instance.workStartDate,
      'lastLogin': instance.lastLogin,
      'description': instance.description,
      'id': instance.id,
      'name': instance.name,
      'nickname': instance.nickname,
      'email': instance.email,
      'image': instance.image,
      'phoneNumber': instance.phoneNumber,
      'roles': instance.roles,
    };
