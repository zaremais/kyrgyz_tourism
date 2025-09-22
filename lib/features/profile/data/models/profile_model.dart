import 'package:json_annotation/json_annotation.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/features/profile/domain/entities/profile_entity.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel extends ProfileEntity {
  ProfileModel({
    required super.fullName,
    required super.birthDate,
    required super.lastLogin,
    required super.workStartDate,
    required super.description,
    required super.id,
    required super.name,
    required super.nickname,
    required super.email,
    required super.image,
    required super.phoneNumber,
    required super.roles,
  });
  factory ProfileModel.fromJson(JSON json) => _$ProfileModelFromJson(json);
  JSON toJson() => _$ProfileModelToJson(this);
}
