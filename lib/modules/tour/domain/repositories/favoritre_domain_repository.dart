import 'package:kyrgyz_tourism/modules/tour/data/models/tour_model.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/usecases/add_favorite_use_case.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/usecases/delete_favorite_use_case.dart';

abstract class FavoriteDomainRepository {
  Future<List<TourModel>> getFavorite();
  Future<void> addFavoriteTour(AddFavoriteParams params);
  Future<void> deleteFavoriteTour(DeleteFavoriteParams params);
}
