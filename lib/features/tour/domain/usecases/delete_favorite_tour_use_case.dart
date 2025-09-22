import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_params.dart';
import 'package:kyrgyz_tourism/features/tour/data/sqflite/schema.dart';
import 'package:kyrgyz_tourism/features/tour/domain/repositories/favorite_tour_domain_repository.dart';

@injectable
class DeleteFavoriteTourUseCase extends BaseParams {
  final FavoriteToursDomainRepository _repository;

  DeleteFavoriteTourUseCase({required FavoriteToursDomainRepository repository})
    : _repository = repository;

  Future<void> execute(FavoriteTourModel tour) async {
    try {
      await _repository.deleteFavoriteTour(tour);
    } catch (e) {
      rethrow;
    }
  }
}
