import 'package:kyrgyz_tourism/modules/reviews/domain/entities/reviews_entity.dart';
import 'package:kyrgyz_tourism/modules/reviews/domain/usecases/get_reviews_use_case.dart';

abstract class ReviewsDomainRepository {
  Future<List<ReviewsEntity>> getReviews(SubmitReviewParams params);
}
