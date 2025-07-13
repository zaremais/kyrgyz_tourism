class TourEntity {
  final int? id;
  final int? authorId;
  final String? title;
  final String? description;
  final int? price;
  final int? duration;
  final int? tourDuration;
  final double? rating;
  final int? placesLeft;
  final String? meetingPoint;
  final bool? guideIncluded;
  final bool? withAccommodation;
  final bool? withFood;
  final int? maxGroupSize;
  final String? difficulty;
  final String? region;
  final String? image;
  final List<String>? departureDates;
  final String? category;
  final int? groupPeople;
  final int? ageLimit;
  final bool? oneDay;
  final bool? longTerm;
  final bool? smallGroup;
  final bool? bigGroup;

  TourEntity({
    this.id,
    this.authorId,
    this.title,
    this.description,
    this.price,
    this.tourDuration,
    this.duration,
    this.meetingPoint,
    this.guideIncluded,
    this.withAccommodation,
    this.withFood,
    this.maxGroupSize,
    this.difficulty,
    this.rating,
    this.placesLeft,
    this.region,
    this.image,
    this.departureDates,
    this.category,
    this.groupPeople,
    this.ageLimit,
    this.oneDay,
    this.longTerm,
    this.smallGroup,
    this.bigGroup,
  });
}
