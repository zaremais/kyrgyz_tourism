// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TourModel _$TourModelFromJson(Map<String, dynamic> json) => TourModel(
  id: (json['id'] as num?)?.toInt(),
  authorId: (json['authorId'] as num?)?.toInt(),
  title: json['title'] as String?,
  description: json['description'] as String?,
  price: (json['price'] as num?)?.toInt(),
  duration: (json['duration'] as num?)?.toInt(),
  meetingPoint: json['meetingPoint'] as String?,
  guideIncluded: json['guideIncluded'] as bool?,
  withAccommodation: json['withAccommodation'] as bool?,
  withFood: json['withFood'] as bool?,
  maxGroupSize: (json['maxGroupSize'] as num?)?.toInt(),
  difficulty: json['difficulty'] as String?,
  tourDuration: (json['tourDuration'] as num?)?.toInt(),
  rating: (json['rating'] as num?)?.toDouble(),
  placesLeft: (json['placesLeft'] as num?)?.toInt(),
  region: json['region'] as String?,
  image: json['image'] as String?,
  departureDates:
      (json['departureDates'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
  category: json['category'] as String?,
  groupPeople: (json['groupPeople'] as num?)?.toInt(),
  ageLimit: (json['ageLimit'] as num?)?.toInt(),
  oneDay: json['oneDay'] as bool?,
  longTerm: json['longTerm'] as bool?,
  smallGroup: json['smallGroup'] as bool?,
  bigGroup: json['bigGroup'] as bool?,
);

Map<String, dynamic> _$TourModelToJson(TourModel instance) => <String, dynamic>{
  'id': instance.id,
  'authorId': instance.authorId,
  'title': instance.title,
  'description': instance.description,
  'price': instance.price,
  'duration': instance.duration,
  'tourDuration': instance.tourDuration,
  'rating': instance.rating,
  'placesLeft': instance.placesLeft,
  'meetingPoint': instance.meetingPoint,
  'guideIncluded': instance.guideIncluded,
  'withAccommodation': instance.withAccommodation,
  'withFood': instance.withFood,
  'maxGroupSize': instance.maxGroupSize,
  'difficulty': instance.difficulty,
  'region': instance.region,
  'image': instance.image,
  'departureDates': instance.departureDates,
  'category': instance.category,
  'groupPeople': instance.groupPeople,
  'ageLimit': instance.ageLimit,
  'oneDay': instance.oneDay,
  'longTerm': instance.longTerm,
  'smallGroup': instance.smallGroup,
  'bigGroup': instance.bigGroup,
};
