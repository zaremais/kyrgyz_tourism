// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
  fullName: json['fullName'] as String,
  nickName: json['nickName'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String,
  birthDate: json['birthDate'] as String,
  startDay: json['startDay'] as String,
  status: json['status'] as String,
  employee: json['employee'] as String,
  endDay: json['endDay'] as String,
  location: json['location'] as String,
);

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'nickName': instance.nickName,
      'email': instance.email,
      'phone': instance.phone,
      'birthDate': instance.birthDate,
      'startDay': instance.startDay,
      'status': instance.status,
      'employee': instance.employee,
      'endDay': instance.endDay,
      'location': instance.location,
    };
