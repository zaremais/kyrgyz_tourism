import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/entities/tour_entity.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/usecases/filter_tours_use_case.dart';

@injectable
class FilterTourCubit extends Cubit<BaseState<List<TourEntity>>> {
  final FilterTourUseCase _filterTourUseCase;

  FilterTourCubit({required FilterTourUseCase filterTourUseCase})
    : _filterTourUseCase = filterTourUseCase,
      super(BaseState(status: StateStatus.init));

  Future<void> filterTour(FilterTourParams params) async {
    emit(BaseState(status: StateStatus.loading));
    try {
      final result = await _filterTourUseCase.execute(params: params);
      emit(BaseState(status: StateStatus.success, model: result));
    } catch (e) {
      emit(BaseState(status: StateStatus.failure, errorMessage: e.toString()));
    }
  }
}
