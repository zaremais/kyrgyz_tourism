import 'package:json_annotation/json_annotation.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/modules/booking_tour/domain/entities/booking_date_entity.dart';

part 'booking_date_model.g.dart';

@JsonSerializable()
class BookingDateModel extends BookingDateEntity {
  BookingDateModel({
    required super.id,
    required super.departureDateTime,
    required super.placesLeft,
    required super.tourId,
  });

  factory BookingDateModel.fromJson(JSON json) =>
      _$BookingDateModelFromJson(json);
  JSON toJSon() => _$BookingDateModelToJson(this);
}
