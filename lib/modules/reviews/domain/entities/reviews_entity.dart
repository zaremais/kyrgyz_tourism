class ReviewsEntity {
  final int id;
  final String name;
  final double rating;
  final String comment;
  final String? imageUrl;

  ReviewsEntity({
    required this.id,
    required this.name,
    required this.rating,
    required this.comment,
    required this.imageUrl,
  });
}
