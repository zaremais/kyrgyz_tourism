import 'package:json_annotation/json_annotation.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import '../../domain/entities/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  UserModel({
    super.id,
    super.email,
    super.userName,
    super.phone,
    super.code,
    super.password,
    super.message,
  });

  factory UserModel.fromJson(JSON json) => _$UserModelFromJson(json);
  JSON toJson() => _$UserModelToJson(this);
}
