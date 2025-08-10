import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/modules/reviews/domain/entities/reviews_entity.dart';
import 'package:kyrgyz_tourism/modules/reviews/domain/repositories/reviews_domain_repository.dart';

@injectable
class GetReviewsUseCase extends BaseUsecase<List<ReviewsEntity>, ReviewParams> {
  final ReviewsDomainRepository _repository;

  GetReviewsUseCase({required ReviewsDomainRepository repository})
    : _repository = repository;

  @override
  Future<List<ReviewsEntity>> execute({required ReviewParams params}) async {
    return _repository.getReviews(params);
  }
}

class ReviewParams {
  final String comment;
  final double rating;

  const ReviewParams({required this.comment, required this.rating});

  JSON toJson() {
    return {'comment': comment, 'rating': rating};
  }
}
