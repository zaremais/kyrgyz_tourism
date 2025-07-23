import 'package:json_annotation/json_annotation.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/sign_up_entity.dart';

part 'sign_up_model.g.dart';

@JsonSerializable()
class SignUpModel extends SignUpEntity {
  SignUpModel({super.email, super.nickname, super.password});

  factory SignUpModel.fromJson(JSON json) => _$SignUpModelFromJson(json);
  JSON toJson() => _$SignUpModelToJson(this);
}
