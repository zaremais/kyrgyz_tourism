import 'package:json_annotation/json_annotation.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/modules/reviews/domain/entities/reviews_entity.dart';

part 'reviews_model.g.dart';

@JsonSerializable()
class ReviewsModel extends ReviewsEntity {
  ReviewsModel({
    required super.id,
    required super.name,
    required super.rating,
    required super.comment,
    super.imageUrl,
  });

  factory ReviewsModel.fromJson(JSON json) => _$ReviewsModelFromJson(json);
  JSON toJson() => _$ReviewsModelToJson(this);
}
