import 'package:json_annotation/json_annotation.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/features/auth/domain/entities/verify_code_entity.dart';

part 'verify_code_model.g.dart';

@JsonSerializable()
class VerifyCodeModel extends VerifyCodeEntity {
  VerifyCodeModel({required super.success});

  factory VerifyCodeModel.fromJson(JSON json) =>
      _$VerifyCodeModelFromJson(json);
  JSON toJson() => _$VerifyCodeModelToJson(this);
}
