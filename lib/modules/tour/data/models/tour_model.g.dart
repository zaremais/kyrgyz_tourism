// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TourModel _$TourModelFromJson(Map<String, dynamic> json) => TourModel(
  departureDate: json['departureDate'] as String,
  tourDuration: (json['tourDuration'] as num).toInt(),
  id: (json['id'] as num).toInt(),
  location: json['location'] as String?,
  category: json['category'] as String?,
  groupPeople: (json['groupPeople'] as num?)?.toInt(),
  age: (json['age'] as num?)?.toInt(),
  title: json['title'] as String,
  price: (json['price'] as num).toDouble(),
  image: json['image'] as String,
  placesLeft: (json['placesLeft'] as num).toInt(),
  rating: (json['rating'] as num).toDouble(),
);

Map<String, dynamic> _$TourModelToJson(TourModel instance) => <String, dynamic>{
  'departureDate': instance.departureDate,
  'tourDuration': instance.tourDuration,
  'id': instance.id,
  'location': instance.location,
  'category': instance.category,
  'groupPeople': instance.groupPeople,
  'age': instance.age,
  'title': instance.title,
  'price': instance.price,
  'image': instance.image,
  'placesLeft': instance.placesLeft,
  'rating': instance.rating,
};
