import 'package:kyrgyz_tourism/modules/reviews/domain/entities/reviews_entity.dart';

abstract class ReviewsDomainRepository {
  Future<List<ReviewsEntity>> getReviews();
}
