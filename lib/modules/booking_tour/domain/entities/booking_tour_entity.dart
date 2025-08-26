class BookingTourEntity {
  final int id;
  final int tourId;
  final int userId;
  final String selectedDate;
  final int numberOfPeople;
  final double price;
  final String status;
  final DateTime departureDateTime;
  final int? placesLeft;

  BookingTourEntity({
    required this.id,
    required this.tourId,
    required this.userId,
    required this.selectedDate,
    required this.numberOfPeople,
    required this.price,
    required this.status,
    required this.departureDateTime,
    required this.placesLeft,
  });
}
