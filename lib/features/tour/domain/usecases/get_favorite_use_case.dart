import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/features/tour/domain/entities/tour_entity.dart';
import 'package:kyrgyz_tourism/features/tour/domain/repositories/favoritre_domain_repository.dart';

@injectable
class GetFavoriteUseCase extends BaseUsecase<List<TourEntity>, NoParams> {
  final FavoriteDomainRepository _repository;

  GetFavoriteUseCase({required FavoriteDomainRepository repository})
    : _repository = repository;

  @override
  Future<List<TourEntity>> execute({required NoParams params}) async {
    return await _repository.getFavorite();
  }
}
