// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_tour_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingTourModel _$BookingTourModelFromJson(Map json) => BookingTourModel(
  id: (json['id'] as num).toInt(),
  tourId: (json['tourId'] as num).toInt(),
  userId: (json['userId'] as num).toInt(),
  selectedDate: json['selectedDate'] as String,
  numberOfPeople: (json['numberOfPeople'] as num).toInt(),
  price: (json['price'] as num).toDouble(),
  status: json['status'] as String,
);

Map<String, dynamic> _$BookingTourModelToJson(BookingTourModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tourId': instance.tourId,
      'userId': instance.userId,
      'selectedDate': instance.selectedDate,
      'numberOfPeople': instance.numberOfPeople,
      'price': instance.price,
      'status': instance.status,
    };
