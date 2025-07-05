import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/modules/reviews/domain/entities/reviews_entity.dart';
import 'package:kyrgyz_tourism/modules/reviews/domain/repositories/reviews_domain_repository.dart';

@injectable
class GetReviewsUseCase extends BaseUsecase<List<ReviewsEntity>, void> {
  final ReviewsDomainRepository _repository;

  GetReviewsUseCase({required ReviewsDomainRepository repository})
    : _repository = repository;

  @override
  Future<List<ReviewsEntity>> execute({required params}) async {
    return _repository.getReviews();
  }
}
