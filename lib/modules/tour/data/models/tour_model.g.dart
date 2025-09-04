// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TourModel _$TourModelFromJson(Map json) => TourModel(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  author: json['author'] as String?,
  price: (json['price'] as num?)?.toInt(),
  tourDuration: (json['tourDuration'] as num?)?.toInt(),
  rating: (json['rating'] as num?)?.toDouble(),
  placesLeft: (json['placesLeft'] as num?)?.toInt(),
  region: json['region'] as String?,
  image: json['image'] as String?,
  departureDates:
      (json['departureDates'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
  meetingPoint: json['meetingPoint'] as String?,
  difficulty: json['difficulty'] as String?,
  groupSize: (json['groupSize'] as num?)?.toInt(),
  minAge: json['minAge'] as String?,
);

Map<String, dynamic> _$TourModelToJson(TourModel instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'author': instance.author,
  'price': instance.price,
  'tourDuration': instance.tourDuration,
  'rating': instance.rating,
  'placesLeft': instance.placesLeft,
  'region': instance.region,
  'image': instance.image,
  'departureDates': instance.departureDates,
  'meetingPoint': instance.meetingPoint,
  'difficulty': instance.difficulty,
  'groupSize': instance.groupSize,
  'minAge': instance.minAge,
};
