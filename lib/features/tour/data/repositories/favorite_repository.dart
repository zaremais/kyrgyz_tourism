// import 'package:injectable/injectable.dart';
// import 'package:kyrgyz_tourism/modules/tour/data/api_service/tour_api_service.dart';
// import 'package:kyrgyz_tourism/modules/tour/data/models/tour_model.dart';
// import 'package:kyrgyz_tourism/modules/tour/domain/repositories/favoritre_domain_repository.dart';
// import 'package:kyrgyz_tourism/modules/tour/domain/usecases/add_favorite_use_case.dart';
// import 'package:kyrgyz_tourism/modules/tour/domain/usecases/delete_favorite_use_case.dart';

// @LazySingleton(as: FavoriteDomainRepository)
// class FavoriteRepository extends FavoriteDomainRepository {
//   final TourApiService _apiFavoritre;

//   FavoriteRepository({required TourApiService apiFavoritre})
//     : _apiFavoritre = apiFavoritre;

//   @override
//   Future<void> addFavoriteTour(AddFavoriteParams params) async {
//     return await _apiFavoritre.addFavoritesTours(params.tourId);
//   }

//   @override
//   Future<void> deleteFavoriteTour(DeleteFavoriteParams params) async {
//     return await _apiFavoritre.deleteFavoriteTour(params.tourId);
//   }

//   @override
//   Future<List<TourModel>> getFavorite() async {
//     return await _apiFavoritre.getFavoriteTours();
//   }
// }
