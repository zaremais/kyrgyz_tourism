class TourEntity {
  final int id;
  final int author;
  final String title;
  final double price;
  final int tourDuration;
  final double rating;
  final int placesLeft;
  final String region;
  final String image;
  final List<String> departureDates;

  TourEntity({
    required this.id,
    required this.author,
    required this.title,
    required this.price,
    required this.tourDuration,
    required this.rating,
    required this.placesLeft,
    required this.region,
    required this.image,
    required this.departureDates,
  });
}

//   factory TourEntity.fromModel(TourModel model) {
//     return TourEntity(
//       id: model.id,
//       author: model.author,
//       title: model.title,
//       description: model.description,
//       price: model.price,
//       duration: model.duration,
//       tourDuration: model.tourDuration,
//       rating: model.rating,
//       placesLeft: model.placesLeft,
//       meetingPoint: model.meetingPoint,
//       guideIncluded: model.guideIncluded,
//       withAccommodation: model.withAccommodation,
//       withFood: model.withFood,
//       maxGroupSize: model.maxGroupSize,
//       difficulty: model.difficulty,
//       region: model.region,
//       image: model.image,
//       departureDates: model.departureDates,
//       category: model.category,
//       groupSize: model.groupSize,
//       minAge: model.minAge,
//       oneDay: model.oneDay,
//       longTerm: model.longTerm,
//       smallGroup: model.smallGroup,
//       bigGroup: model.bigGroup,
//       url: model.url,
//     );
//   }
// }
