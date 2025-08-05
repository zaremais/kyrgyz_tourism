import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/modules/reviews/domain/entities/reviews_entity.dart';
import 'package:kyrgyz_tourism/modules/reviews/domain/repositories/reviews_domain_repository.dart';

@injectable
class GetReviewsUseCase
    extends BaseUsecase<List<ReviewsEntity>, SubmitReviewParams> {
  final ReviewsDomainRepository _repository;

  GetReviewsUseCase({required ReviewsDomainRepository repository})
    : _repository = repository;

  @override
  Future<List<ReviewsEntity>> execute({
    required SubmitReviewParams params,
  }) async {
    return _repository.getReviews(params);
  }
}

class SubmitReviewParams {
  final int tourId;
  final String comment;
  final double rating;

  const SubmitReviewParams({
    required this.tourId,
    required this.comment,
    required this.rating,
  });

  JSON toJson() {
    return {'tourId': tourId, 'comment': comment, 'rating': rating};
  }
}
