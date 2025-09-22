import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/features/reviews/domain/repositories/reviews_domain_repository.dart';

@injectable
class AddReviewsUseCase extends BaseUsecase<void, AddReviewsParams> {
  final ReviewsDomainRepository _repository;

  AddReviewsUseCase({required ReviewsDomainRepository repository})
    : _repository = repository;

  @override
  Future<void> execute({required AddReviewsParams params}) async {
    return _repository.addReviews(params);
  }
}

class AddReviewsParams {
  final String comment;
  final double rating;

  AddReviewsParams({required this.comment, required this.rating});

  JSON toJson() {
    return {'comment': comment, 'rating': rating};
  }
}
