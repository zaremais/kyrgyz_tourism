class TourEntity {
  final int? id;
  final String? title;
  final String? author;
  final int? price;
  final int? tourDuration;
  final double? rating;
  final int? placesLeft;
  final String? region;
  final String? image;
  final List<String>? departureDates;
  final String? meetingPoint;
  final String? difficulty;
  final int? groupSize;
  final String? minAge;

  const TourEntity({
    this.id,
    this.title,
    this.author,
    this.price,
    this.tourDuration,
    this.rating,
    this.placesLeft,
    this.region,
    this.image,
    this.departureDates,
    this.meetingPoint,
    this.difficulty,
    this.groupSize,
    this.minAge,
  });
}
