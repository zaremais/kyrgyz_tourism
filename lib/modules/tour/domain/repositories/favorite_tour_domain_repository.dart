import 'package:kyrgyz_tourism/modules/tour/data/sqflite/schema.dart';

abstract class FavoriteToursDomainRepository {
  Future<List<FavoriteTourModel>> getFavoriteTours();
  Future<void> addFavoriteTour(FavoriteTourModel favorite);
  Future<void> deleteFavoriteTour(FavoriteTourModel favorite);
}
