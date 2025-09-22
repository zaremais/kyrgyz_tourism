import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/features/booking_tour/domain/entities/booking_tour_entity.dart';
import 'package:kyrgyz_tourism/features/booking_tour/domain/usecases/booking_date_use_case.dart';
import 'package:kyrgyz_tourism/features/booking_tour/domain/usecases/booking_tour_use_case.dart';

@injectable
class BookingTourCubit extends Cubit<BaseState<BookingTourEntity>> {
  final BookingTourUseCase _bookingTourUseCase;

  BookingTourCubit({
    required BookingTourUseCase bookingTourUseCase,
    required BookingDateUseCase bookingDateUseCase,
  }) : _bookingTourUseCase = bookingTourUseCase,

       super(BaseState(status: StateStatus.init));

  Future<void> bookingTour(BookingTourParams params) async {
    emit(BaseState(status: StateStatus.loading));
    try {
      await _bookingTourUseCase.execute(params: params);

      emit(BaseState(status: StateStatus.success, model: state.model));
    } catch (e) {
      emit(BaseState(status: StateStatus.failure, errorMessage: e.toString()));
    }
  }
}
