import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/modules/payment/domain/usecases/confirm_booked_use_case.dart';

@injectable
class ConfirmBookedCubit extends Cubit<BaseState<bool>> {
  final ConfirmBookedUseCase _confirmBookedUseCase;

  ConfirmBookedCubit({required ConfirmBookedUseCase confirmBookedUseCase})
    : _confirmBookedUseCase = confirmBookedUseCase,
      super(BaseState(status: StateStatus.init));

  Future<void> confirm() async {
    emit(BaseState(status: StateStatus.loading));
    try {
      await _confirmBookedUseCase.execute(params: NoParams());
      emit(BaseState(status: StateStatus.success, model: state.model));
    } catch (e) {
      emit(BaseState(status: StateStatus.failure, errorMessage: e.toString()));
    }
  }
}
