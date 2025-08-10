import 'package:json_annotation/json_annotation.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/entities/tour_entity.dart';

part 'tour_model.g.dart';

@JsonSerializable()
class TourModel extends TourEntity {
  TourModel({
    required super.id,
    required super.title,
    required super.author,
    required super.price,
    required super.tourDuration,
    required super.rating,
    required super.placesLeft,
    required super.region,
    required super.image,
    required super.departureDates,
    required super.meetingPoint,
    required super.difficulty,
    required super.groupSize,
    required super.minAge,
  });

  factory TourModel.fromJson(JSON json) => _$TourModelFromJson(json);

  JSON toJson() => _$TourModelToJson(this);
}
