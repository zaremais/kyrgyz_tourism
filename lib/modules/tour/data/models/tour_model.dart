import 'package:json_annotation/json_annotation.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/entities/tour_entity.dart';

part 'tour_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TourModel extends TourEntity {
  TourModel({
    super.id,
    super.authorId,
    super.title,
    super.description,
    super.price,
    super.duration,
    super.meetingPoint,
    super.guideIncluded,
    super.withAccommodation,
    super.withFood,
    super.maxGroupSize,
    super.difficulty,
    super.tourDuration,
    super.rating,
    super.placesLeft,
    super.region,
    super.image,
    super.departureDates,
    super.category,
    super.groupPeople,
    super.ageLimit,
    super.oneDay,
    super.longTerm,
    super.smallGroup,
    super.bigGroup,
  });

  factory TourModel.fromJson(JSON json) => _$TourModelFromJson(json);
  JSON toJson() => _$TourModelToJson(this);
}
