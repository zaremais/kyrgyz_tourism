import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/usecases/get_individual_tour_use_case.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/usecases/get_tours_use_case.dart';
import '../../domain/entities/tour_entity.dart';

@injectable
class TourCubit extends Cubit<BaseState<List<TourEntity>>> {
  final GetToursUseCase _getTourUsecase;
  final GetIndividualTourUseCase _getIndividualTourUseCase;
  // final FilterTourUseCase _filterTourUseCase;
  // final UploadImageUseCase _uploadImageUseCase;

  TourCubit({
    required GetToursUseCase getTourUsecase,
    required GetIndividualTourUseCase getIndividualUsecase,
    // required FilterTourUseCase filterToursUseCase,
    // required UploadImageUseCase uploadImageUseCase,
  }) : _getTourUsecase = getTourUsecase,
       _getIndividualTourUseCase = getIndividualUsecase,

       //  _filterTourUseCase = filterToursUseCase,
       //  _uploadImageUseCase = uploadImageUseCase,
       super(BaseState(status: StateStatus.init));

  Future<void> getTours() async {
    emit(BaseState(status: StateStatus.loading));
    try {
      final result = await _getTourUsecase.execute(
        params: GetToursParams(page: 1, size: 10, sort: 'averageRating.desc'),
      );
      emit(BaseState(status: StateStatus.success, model: result));
    } catch (e) {
      emit(BaseState(status: StateStatus.error, model: []));
    }
  }

  // Future<void> filterTour() async {
  //   emit(BaseState(status: StateStatus.loading));
  //   try {
  //     await _filterTourUseCase.execute(params: null);
  //     emit(BaseState(status: StateStatus.success, model: state.model));
  //   } catch (e) {
  //     emit(BaseState(status: StateStatus.error, errorMessage: e.toString()));
  //   }
  // }

  Future<void> getIndividualTour() async {
    emit(BaseState(status: StateStatus.loading));
    try {
      final tours = await _getIndividualTourUseCase.execute(params: null);
      emit(BaseState(status: StateStatus.success, model: tours));
    } catch (e) {
      emit(BaseState(status: StateStatus.error, errorMessage: e.toString()));
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
