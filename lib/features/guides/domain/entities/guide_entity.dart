class GuideEntity {
  final int? id;
  final String? name;
  final String? image;
  final double? rating;
  final int? reviews;
  final int? experience;
  final String? description;

  GuideEntity({
    required this.id,
    this.name,
    this.image,
    this.rating,
    this.reviews,
    this.experience,
    this.description,
  });
}
