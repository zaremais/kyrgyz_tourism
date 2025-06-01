import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/modules/tour/data/sqflite/database.dart';
import 'package:kyrgyz_tourism/modules/tour/data/sqflite/schema.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/repositories/favorite_tour_domain_repository.dart';

@LazySingleton(as: FavoriteToursDomainRepository)
class FavoriteToursRepository extends FavoriteToursDomainRepository {
  FavoriteToursRepository();

  @override
  Future<void> addFavoriteTour(FavoriteTourModel tour) async {
    try {
      final FavoriteToursDatabase databaseService =
          FavoriteToursDatabase.instance;
      final sqflite = await databaseService.database;
      await sqflite.insert(FavoriteToursFields.tableName, tour.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteFavoriteTour(FavoriteTourModel tour) async {
    try {
      final FavoriteToursDatabase databaseService =
          FavoriteToursDatabase.instance;
      final sqflite = await databaseService.database;
      await sqflite.delete(
        FavoriteToursFields.tableName,
        where: '${FavoriteToursFields.tourId} = ?',
        whereArgs: [tour.tourId],
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<FavoriteTourModel>> getFavoriteTours() async {
    try {
      final FavoriteToursDatabase databaseService =
          FavoriteToursDatabase.instance;
      final sqflite = await databaseService.database;
      final data = await sqflite.query(FavoriteToursFields.tableName);
      List<FavoriteTourModel> tours = [];

      for (var item in data) {
        tours = [...tours, FavoriteTourModel.fromJson(item)];
      }
      return tours;
    } catch (e) {
      rethrow;
    }
  }
}
