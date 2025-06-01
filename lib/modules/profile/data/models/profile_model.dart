import 'package:json_annotation/json_annotation.dart';
import 'package:kyrgyz_tourism/modules/profile/domain/entities/profile_entity.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel extends ProfileEntity {
  ProfileModel({
    required super.fullName,
    required super.nickName,
    required super.email,
    required super.phone,
    required super.birthDate,
    required super.startDay,
    required super.status,
    required super.employee,
    required super.endDay,
    required super.location,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
