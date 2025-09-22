import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/features/tour/domain/repositories/favoritre_domain_repository.dart';

@injectable
class DeleteFavoriteUseCase extends BaseUsecase<void, DeleteFavoriteParams> {
  final FavoriteDomainRepository _repository;

  DeleteFavoriteUseCase({required FavoriteDomainRepository repository})
    : _repository = repository;

  @override
  Future<void> execute({required DeleteFavoriteParams params}) async {
    return await _repository.deleteFavoriteTour(params);
  }
}

class DeleteFavoriteParams {
  final int tourId;

  DeleteFavoriteParams({required this.tourId});

  JSON toJson() {
    return {'tourId': tourId};
  }
}
