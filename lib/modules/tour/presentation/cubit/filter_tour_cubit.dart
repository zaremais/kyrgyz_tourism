// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:kyrgyz_tourism/core/base/base_state.dart';
// import 'package:kyrgyz_tourism/core/enums/state_status.dart';
// import 'package:kyrgyz_tourism/modules/tour/domain/usecases/filter_tours_use_case.dart';

// class FilterTourCubit  extends Cubit<BaseState<FilterTourCubit>>{
//   final FilterTourUseCase _filterTourUseCase;

//   FilterTourCubit({required FilterTourUseCase filterTourUseCase}) : _filterTourUseCase = filterTourUseCase, super(BaseState(status: StateStatus.init));

//   Future<void>filterTour()async{
// emit(BaseState(status: StateStatus.loading));
// try {
//  await _filterTourUseCase.execute(params: null);
//   emit(BaseState(status: StateStatus.success, model: state.model));
// } catch (e) {
//   emit(BaseState(status: StateStatus.error, errorMessage: e.toString()));
// }
//   }
// }
