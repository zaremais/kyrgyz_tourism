import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/password_reset_use_case.dart';

@injectable
class PasswordResetCubit extends Cubit<BaseState<void>> {
  final PasswordResetUseCase _resetPasswordUseCase;

  PasswordResetCubit({required PasswordResetUseCase resetPasswordUseCase})
    : _resetPasswordUseCase = resetPasswordUseCase,
      super(BaseState(status: StateStatus.init));

  Future<void> resetPassword({required PasswordResetParams params}) async {
    emit(BaseState(status: StateStatus.loading));
    try {
      await _resetPasswordUseCase.execute(params: params);
      emit(BaseState(status: StateStatus.success, model: null));
    } catch (e) {
      emit(BaseState(status: StateStatus.failure, errorMessage: e.toString()));
    }
  }
}
