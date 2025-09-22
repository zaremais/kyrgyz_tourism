import 'package:json_annotation/json_annotation.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/features/guides/domain/entities/guide_entity.dart';

part 'guide_model.g.dart';

@JsonSerializable()
class GuideModel extends GuideEntity {
  GuideModel({
    required super.id,
    required super.name,
    required super.image,
    required super.rating,
    required super.reviews,
    required super.experience,
    required super.description,
  });

  factory GuideModel.fromJson(JSON json) => _$GuideModelFromJson(json);
  JSON toJson() => _$GuideModelToJson(this);
}
