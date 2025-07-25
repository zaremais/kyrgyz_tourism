import 'package:json_annotation/json_annotation.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/sign_in_entity.dart';

part 'sign_in_model.g.dart';

@JsonSerializable()
class SignInModel extends SignInEntity {
  SignInModel(
    super.accessToken,
    super.refreshToken,
    super.identifier,
    super.password,
    super.message,
  );

  factory SignInModel.fromJson(JSON json) => _$SignInModelFromJson(json);
  JSON toJson() => _$SignInModelToJson(this);
}
