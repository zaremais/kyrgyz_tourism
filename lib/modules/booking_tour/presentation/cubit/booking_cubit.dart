import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';

import 'package:kyrgyz_tourism/modules/booking_tour/domain/entities/booking_tour_entity.dart';
import 'package:kyrgyz_tourism/modules/booking_tour/domain/usecases/booking_date_use_case.dart';

@injectable
class BookingDateCubit extends Cubit<BaseState<List<BookingTourEntity>>> {
  final BookingDateUseCase bookingDateUseCase;

  final int tourId;

  DateTime? _selectedDate;

  BookingDateCubit({required this.bookingDateUseCase, required this.tourId})
    : super(BaseState(status: StateStatus.init, model: const []));

  DateTime? get selectedDate => _selectedDate;

  Future<void> loadDates() async {
    emit(BaseState(status: StateStatus.loading, model: state.model));
    try {
      await bookingDateUseCase.execute(
        params: BookingDateParams(tourId: tourId),
      );
      emit(BaseState(status: StateStatus.success, model: state.model));
    } catch (e) {
      emit(BaseState(status: StateStatus.failure, errorMessage: e.toString()));
    }
  }

  void selectDate(DateTime date) {
    _selectedDate = date;
  }

  // Future<void> bookTour(int numberOfPeople, {String? promoCode}) async {
  //   if (_selectedDate == null) {
  //     emit(
  //       BaseState(
  //         status: StateStatus.failure,
  //         errorMessage: 'Выберите дату для бронирования',
  //         model: state.model,
  //       ),
  //     );
  //     return;
  //   }

  //   emit(BaseState(status: StateStatus.loading, model: state.model));
  //   try {
  //     await bookingTourUseCase.execute(
  //       params: BookingTourParams(
  //         tourId: tourId,
  //         selectedDate: _selectedDate!.toIso8601String(),
  //         numberOfPeople: numberOfPeople,
  //         promoCode: promoCode,
  //       ),
  //     );

  //     // Перезагружаем даты после успешного бронирования
  //     await loadDates();

  //     // Эмитим успех с сообщением
  //     emit(
  //       BaseState(
  //         status: StateStatus.success,
  //         model: state.model,
  //         // successMessage: 'Тур успешно забронирован!',
  //       ),
  //     );
  //   } catch (e) {
  //     emit(
  //       BaseState(
  //         status: StateStatus.failure,
  //         errorMessage: e.toString(),
  //         model: state.model,
  //       ),
  //     );
  //   }
  // }

  void clearSelection() {
    _selectedDate = null;
  }

  void resetState() {
    _selectedDate = null;
    emit(BaseState(status: StateStatus.init, model: const []));
  }
}
