import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/usecases/get_tours_use_case.dart';
import '../../domain/entities/tour_entity.dart';

@injectable
class TourCubit extends Cubit<BaseState<List<TourEntity>>> {
  final GetToursUseCase _getTourUsecase;

  TourCubit({required GetToursUseCase getTourUsecase})
    : _getTourUsecase = getTourUsecase,

      super(BaseState(status: StateStatus.init));

  Future<void> getTours() async {
    emit(BaseState(status: StateStatus.loading));
    try {
      final result = await _getTourUsecase.execute(params: null);
      emit(BaseState(status: StateStatus.success, model: result));
    } catch (e) {
      emit(BaseState(status: StateStatus.error));
    }
  }
}
