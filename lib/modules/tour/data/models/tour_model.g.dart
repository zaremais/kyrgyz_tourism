// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TourModel _$TourModelFromJson(Map json) => TourModel(
  id: (json['id'] as num).toInt(),
  author: (json['author'] as num).toInt(),
  title: json['title'] as String,
  price: (json['price'] as num).toDouble(),
  tourDuration: (json['tourDuration'] as num).toInt(),
  rating: (json['rating'] as num).toDouble(),
  placesLeft: (json['placesLeft'] as num).toInt(),
  region: json['region'] as String,
  image: json['image'] as String,
  departureDates:
      (json['departureDates'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
);

Map<String, dynamic> _$TourModelToJson(TourModel instance) => <String, dynamic>{
  'id': instance.id,
  'author': instance.author,
  'title': instance.title,
  'price': instance.price,
  'tourDuration': instance.tourDuration,
  'rating': instance.rating,
  'placesLeft': instance.placesLeft,
  'region': instance.region,
  'image': instance.image,
  'departureDates': instance.departureDates,
};
