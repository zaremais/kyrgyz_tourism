import 'package:kyrgyz_tourism/features/tour/data/sqflite/schema.dart';

abstract class FavoriteToursDomainRepository {
  Future<List<FavoriteTourModel>> getFavoriteTours();
  Future<void> addFavoriteTour(FavoriteTourModel favorite);
  Future<void> deleteFavoriteTour(FavoriteTourModel favorite);
}
