import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/modules/tour/data/sqflite/schema.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/usecases/add_favorite_tour_use_case.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/usecases/delete_favorite_tour_use_case.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/usecases/get_favorite_tour_use_case.dart';
import '../../../../core/enums/state_status.dart';

@injectable
class FavoriteTourCubit extends Cubit<BaseState<List<FavoriteTourModel>>> {
  final AddFavoriteToursUseCase _addFavoriteToursUseCase;
  final DeleteFavoriteTourUseCase _deleteFavoriteTourUseCase;
  final GetFavoriteToursUseCase _getFavoriteToursUseCase;

  FavoriteTourCubit({
    required AddFavoriteToursUseCase addFavoriteToursUseCase,
    required DeleteFavoriteTourUseCase deleteFavoriteTourUseCase,
    required GetFavoriteToursUseCase getFavoriteToursUseCase,
  }) : _addFavoriteToursUseCase = addFavoriteToursUseCase,
       _deleteFavoriteTourUseCase = deleteFavoriteTourUseCase,
       _getFavoriteToursUseCase = getFavoriteToursUseCase,
       super(BaseState(status: StateStatus.init, model: []));

  Future<void> getFavorites() async {
    emit(BaseState(status: StateStatus.loading));
    try {
      final favorites = await _getFavoriteToursUseCase.execute();
      emit(BaseState(status: StateStatus.success, model: favorites));
    } catch (e) {
      emit(BaseState(status: StateStatus.failure, model: []));
    }
  }

  Future<void> addToFavorites(FavoriteTourModel tour) async {
    try {
      await _addFavoriteToursUseCase.execute(tour);
      await getFavorites();
    } catch (e) {
      emit(BaseState(status: StateStatus.failure, model: state.model));
    }
  }

  Future<void> removeFromFavorites(FavoriteTourModel tour) async {
    try {
      await _deleteFavoriteTourUseCase.execute(tour);
      await getFavorites();
    } catch (e) {
      emit(BaseState(status: StateStatus.failure, model: state.model));
    }
  }

  Future<void> toggleFavorite(FavoriteTourModel tour) async {
    final isFavorite =
        state.model?.any((t) => t.tourId == tour.tourId) ?? false;

    if (isFavorite) {
      await removeFromFavorites(tour);
    } else {
      await addToFavorites(tour);
    }
  }

  bool isFavorite(int tourId) {
    return state.model?.any((t) => t.tourId == tourId) ?? false;
  }
}
