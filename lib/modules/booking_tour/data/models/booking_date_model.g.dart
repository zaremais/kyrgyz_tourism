// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_date_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingDateModel _$BookingDateModelFromJson(Map json) => BookingDateModel(
  id: (json['id'] as num).toInt(),
  departureDateTime: DateTime.parse(json['departureDateTime'] as String),
  placesLeft: (json['placesLeft'] as num).toInt(),
  tourId: (json['tourId'] as num).toInt(),
);

Map<String, dynamic> _$BookingDateModelToJson(BookingDateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'departureDateTime': instance.departureDateTime.toIso8601String(),
      'placesLeft': instance.placesLeft,
      'tourId': instance.tourId,
    };
