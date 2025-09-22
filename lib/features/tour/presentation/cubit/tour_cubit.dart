import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/features/tour/domain/usecases/filter_tours_use_case.dart';
import 'package:kyrgyz_tourism/features/tour/domain/usecases/get_individual_tour_use_case.dart';
import 'package:kyrgyz_tourism/features/tour/domain/usecases/get_tours_use_case.dart';
import '../../domain/entities/tour_entity.dart';

@injectable
class TourCubit extends Cubit<BaseState<List<TourEntity>>> {
  final GetToursUseCase _getToursUseCase;
  final GetIndividualTourUseCase _getIndividualTourUseCase;
  final FilterTourUseCase _filterTourUseCase;

  TourCubit({
    required GetToursUseCase getToursUseCase,
    required GetIndividualTourUseCase getIndividualTourUseCase,
    required FilterTourUseCase filterTourUseCase,
  }) : _getToursUseCase = getToursUseCase,
       _getIndividualTourUseCase = getIndividualTourUseCase,
       _filterTourUseCase = filterTourUseCase,
       super(BaseState(status: StateStatus.init));

  Future<void> getTours() async {
    emit(BaseState(status: StateStatus.loading));

    try {
      final tours = await _getToursUseCase.execute(
        params: GetToursParams(page: 0, size: 10, sort: 'averageRating,desc'),
      );
      emit(BaseState(status: StateStatus.success, model: tours));
    } catch (e) {
      emit(BaseState(status: StateStatus.failure, errorMessage: e.toString()));
    }
  }

  Future<void> filterTour(FilterTourParams params) async {
    emit(BaseState(status: StateStatus.loading));
    try {
      await _filterTourUseCase.execute(params: params);
      emit(BaseState(status: StateStatus.success, model: state.model));
    } catch (e) {
      emit(BaseState(status: StateStatus.failure, errorMessage: e.toString()));
    }
  }

  Future<void> getIndividualTour() async {
    emit(BaseState(status: StateStatus.loading));
    try {
      final tours = await _getIndividualTourUseCase.execute(params: NoParams());
      emit(BaseState(status: StateStatus.success, model: tours));
    } catch (e) {
      emit(BaseState(status: StateStatus.failure, errorMessage: e.toString()));
    }
  }

  // Future<void> uploadImage(File imageFile) async {
  //   emit(BaseState(status: StateStatus.loading));
  //   try {
  //     await _uploadImageUseCase.execute(params: File('url'));
  //     emit(BaseState(status: StateStatus.success, model: state.model));
  //   } catch (e) {
  //     emit(BaseState(status: StateStatus.error, errorMessage: e.toString()));
  //   }
  // }
}
