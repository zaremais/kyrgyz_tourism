// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewsModel _$ReviewsModelFromJson(Map json) => ReviewsModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  rating: (json['rating'] as num).toDouble(),
  comment: json['comment'] as String,
  imageUrl: json['imageUrl'] as String?,
);

Map<String, dynamic> _$ReviewsModelToJson(ReviewsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rating': instance.rating,
      'comment': instance.comment,
      'imageUrl': instance.imageUrl,
    };
