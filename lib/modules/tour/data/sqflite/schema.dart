class FavoriteToursFields {
  static const String tableName = "favoriteTours";
  static const String idType = "INTEGER PRIMARY KEY";
  static const String tourId = "tour_id";
}

class FavoriteTourModel {
  final int tourId;

  FavoriteTourModel({required this.tourId});

  Map<String, Object?> toJson() => {FavoriteToursFields.tourId: tourId};

  factory FavoriteTourModel.fromJson(Map<String, dynamic> json) {
    return FavoriteTourModel(tourId: json[FavoriteToursFields.tourId] as int);
  }
}
