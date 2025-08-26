import 'package:json_annotation/json_annotation.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/modules/booking_tour/domain/entities/booking_tour_entity.dart';

part 'booking_tour_model.g.dart';

@JsonSerializable()
class BookingTourModel extends BookingTourEntity {
  BookingTourModel({
    required super.id,
    required super.tourId,
    required super.userId,
    required super.selectedDate,
    required super.numberOfPeople,
    required super.price,
    required super.status,
    required super.departureDateTime,
    required super.placesLeft,
  });

  factory BookingTourModel.fromJson(JSON json) =>
      _$BookingTourModelFromJson(json);

  JSON toJson() => _$BookingTourModelToJson(this);
}
