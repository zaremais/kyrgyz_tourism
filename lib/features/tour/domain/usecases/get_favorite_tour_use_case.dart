import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_params.dart';
import 'package:kyrgyz_tourism/features/tour/data/sqflite/schema.dart';
import 'package:kyrgyz_tourism/features/tour/domain/repositories/favorite_tour_domain_repository.dart';

@injectable
class GetFavoriteToursUseCase extends BaseParams {
  final FavoriteToursDomainRepository _repository;

  GetFavoriteToursUseCase({required FavoriteToursDomainRepository repository})
    : _repository = repository;

  Future<List<FavoriteTourModel>> execute() async {
    try {
      return await _repository.getFavoriteTours();
    } catch (e) {
      rethrow;
    }
  }
}
