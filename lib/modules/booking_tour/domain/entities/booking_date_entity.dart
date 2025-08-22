class BookingDateEntity {
  final int id;
  final DateTime departureDateTime;
  final int placesLeft;
  final int tourId;

  BookingDateEntity({
    required this.id,
    required this.departureDateTime,
    required this.placesLeft,
    required this.tourId,
  });
}
