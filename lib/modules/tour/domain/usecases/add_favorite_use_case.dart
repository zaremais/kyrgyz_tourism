import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/repositories/favoritre_domain_repository.dart';

@injectable
class AddFavoriteUseCase extends BaseUsecase<void, AddFavoriteParams> {
  final FavoriteDomainRepository _repository;

  AddFavoriteUseCase({required FavoriteDomainRepository repository})
    : _repository = repository;

  @override
  Future<void> execute({required AddFavoriteParams params}) async {
    return await _repository.addFavoriteTour(params);
  }
}

class AddFavoriteParams {
  final int tourId;

  AddFavoriteParams({required this.tourId});

  JSON toJson() {
    return {'tourId': tourId};
  }
}
