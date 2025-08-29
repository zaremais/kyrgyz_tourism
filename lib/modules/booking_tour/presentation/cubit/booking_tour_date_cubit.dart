import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';

import 'package:kyrgyz_tourism/modules/booking_tour/domain/entities/booking_tour_entity.dart';
import 'package:kyrgyz_tourism/modules/booking_tour/domain/usecases/booking_date_use_case.dart';

@injectable
class BookingTourDateCubit extends Cubit<BaseState<List<BookingTourEntity>>> {
  final BookingDateUseCase _bookingDateUseCase;

  DateTime? _selectedDate;

  BookingTourDateCubit({required BookingDateUseCase bookingDateUseCase})
    : _bookingDateUseCase = bookingDateUseCase,
      super(BaseState(status: StateStatus.init, model: const []));

  DateTime? get selectedDate => _selectedDate;

  Future<void> bookingDate() async {
    emit(BaseState(status: StateStatus.loading));
    try {
      final tourId = await _bookingDateUseCase.execute(
        params: BookingDateParams(tourId: 1),
      );
      emit(BaseState(status: StateStatus.success, model: tourId));
    } catch (e) {
      emit(BaseState(status: StateStatus.failure, errorMessage: e.toString()));
    }
    // void selectDate(DateTime date) {
    //   _selectedDate = date;
    // }

    // void clearSelection() {
    //   _selectedDate = null;
    // }

    // void resetState() {
    //   _selectedDate = null;
    //   emit(BaseState(status: StateStatus.init, model: const []));
    // }
  }
}
