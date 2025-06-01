import 'package:json_annotation/json_annotation.dart';
import 'package:kyrgyz_tourism/modules/users/domain/entities/entity.dart';

part 'model.g.dart';

@JsonSerializable()
class UsersModel extends UsersEntity {
  UsersModel({
    required super.email,
    required super.gender,
    required super.picture,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) =>
      _$UsersModelFromJson(json);
  Map<String, dynamic> toJson() => _$UsersModelToJson(this);
}
