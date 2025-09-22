import 'package:kyrgyz_tourism/features/reviews/domain/entities/reviews_entity.dart';
import 'package:kyrgyz_tourism/features/reviews/domain/usecases/add_reviews_use_case.dart';

abstract class ReviewsDomainRepository {
  Future<List<ReviewsEntity>> getReviews();
  Future<void> addReviews(AddReviewsParams params);
}
