import 'package:json_annotation/json_annotation.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/entities/tour_entity.dart';

part 'tour_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TourModel extends TourEntity {
  // @JsonKey(fromJson: GuideModel.fromJson, toJson: guideToJson)
  // ignore: overridden_fields
  // final GuideModel guide;
  TourModel({
    required super.departureDate,
    required super.tourDuration,
    required super.id,
    required super.location,
    required super.category,
    required super.groupPeople,
    required super.age,
    required super.title,
    required super.price,
    required super.image,
    required super.placesLeft,
    required super.rating,
    // required this.guide,
  });
  // : super(guide: guide);

  factory TourModel.fromJson(Map<String, dynamic> json) =>
      _$TourModelFromJson(json);
  Map<String, dynamic> toJson() => _$TourModelToJson(this);
}

// @JsonSerializable()
// class GuideModel extends GuideEntity {
//   GuideModel({
//     required super.name,
//     required super.description,
//     required super.rating,
//     required super.reviews,
//     required super.experience,
//     required super.imageGuide,
//   });

//   factory GuideModel.fromJson(Map<String, dynamic> json) =>
//       _$GuideModelFromJson(json);
//   Map<String, dynamic> toJson() => _$GuideModelToJson(this);
// }

// Map<String, dynamic> guideToJson(GuideModel guide) => guide.toJson();
