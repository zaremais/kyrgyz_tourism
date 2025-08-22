import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/modules/booking_tour/domain/entities/booking_tour_entity.dart';
import 'package:kyrgyz_tourism/modules/booking_tour/domain/usecases/booking_tour_use_case.dart';

class BookingTourCubit extends Cubit<BaseState<BookingTourEntity>> {
  final BookingTourUseCase _bookingTourUseCase;

  BookingTourCubit({required BookingTourUseCase bookingTourUseCase})
    : _bookingTourUseCase = bookingTourUseCase,
      super(BaseState(status: StateStatus.init));

  Future<void> bookingTour(BookingTourParams params) async {
    emit(BaseState(status: StateStatus.loading));
    try {
      final result = await _bookingTourUseCase.execute(params: params);
      emit(BaseState(status: StateStatus.success, model: result));
    } catch (e) {
      emit(BaseState(status: StateStatus.failure, errorMessage: e.toString()));
    }
  }
}
