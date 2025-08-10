class TourEntity {
  final int id;
  final String title;
  final String author;
  final int price;
  final int tourDuration;
  final int rating;
  final int placesLeft;
  final String region;
  final String image;
  final List<String> departureDates;
  final String? meetingPoint;
  final String? difficulty;
  final int? groupSize;
  final String? minAge;

  const TourEntity({
    required this.id,
    required this.title,
    required this.author,
    required this.price,
    required this.tourDuration,
    required this.rating,
    required this.placesLeft,
    required this.region,
    required this.image,
    required this.departureDates,
    this.meetingPoint,
    this.difficulty,
    this.groupSize,
    this.minAge,
  });
}
