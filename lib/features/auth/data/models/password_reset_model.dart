import 'package:json_annotation/json_annotation.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/features/auth/domain/entities/reset_password_entity.dart';

part 'password_reset_model.g.dart';

@JsonSerializable()
class PasswordResetModel extends PasswordResetEntity {
  PasswordResetModel({required super.message, required super.url});

  factory PasswordResetModel.fromJson(JSON json) =>
      _$PasswordResetModelFromJson(json);
  JSON toJson() => _$PasswordResetModelToJson(this);
}
