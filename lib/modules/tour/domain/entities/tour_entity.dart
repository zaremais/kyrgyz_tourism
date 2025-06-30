class TourEntity {
  final String departureDate;
  final int tourDuration;
  final int id;
  final String? location;
  final String? category;
  final int? groupPeople;
  final int? age;
  final String title;
  final double price;
  final String image;
  final int placesLeft;
  final double rating;
  // final GuideEntity? guide;

  TourEntity({
    required this.departureDate,
    required this.tourDuration,
    required this.id,
    required this.location,
    required this.category,
    required this.groupPeople,
    required this.age,
    required this.title,
    required this.price,
    required this.image,
    required this.placesLeft,
    required this.rating,
    // required this.guide,
  });
}

// class GuideEntity {
//   final String? name;
//   final double? rating;
//   final int? reviews;
//   final String? description;
//   final int? experience;
//   final String? imageGuide;

//   GuideEntity({
//     required this.name,
//     required this.rating,
//     required this.reviews,
//     required this.description,
//     required this.experience,
//     required this.imageGuide,
//   });
// }
