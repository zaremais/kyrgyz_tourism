// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TourModel _$TourModelFromJson(Map<String, dynamic> json) => TourModel(
  authorId: (json['authorId'] as num?)?.toInt(),
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
  guide: GuideModel.fromJson(json['guide'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TourModelToJson(TourModel instance) => <String, dynamic>{
  'departureDate': instance.departureDate,
  'tourDuration': instance.tourDuration,
  'authorId': instance.authorId,
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
  'guide': guideToJson(instance.guide),
};

GuideModel _$GuideModelFromJson(Map<String, dynamic> json) => GuideModel(
  name: json['name'] as String?,
  description: json['description'] as String?,
  rating: (json['rating'] as num?)?.toDouble(),
  reviews: (json['reviews'] as num?)?.toInt(),
  experience: (json['experience'] as num?)?.toInt(),
  imageGuide: json['imageGuide'] as String?,
);

Map<String, dynamic> _$GuideModelToJson(GuideModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'rating': instance.rating,
      'reviews': instance.reviews,
      'description': instance.description,
      'experience': instance.experience,
      'imageGuide': instance.imageGuide,
    };
