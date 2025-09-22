import 'package:json_annotation/json_annotation.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/features/auth/domain/entities/sign_up_entity.dart';

part 'sign_up_model.g.dart';

@JsonSerializable()
class SignUpModel extends SignUpEntity {
  SignUpModel({
    required super.email,
    // required super.nickname,
    // required super.password,
    // required super.message,
    // required super.success,
  });

  factory SignUpModel.fromJson(JSON json) => _$SignUpModelFromJson(json);
  JSON toJson() => _$SignUpModelToJson(this);
}
