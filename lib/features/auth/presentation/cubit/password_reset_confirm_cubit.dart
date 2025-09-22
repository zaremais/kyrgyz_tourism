import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/features/auth/domain/usecases/password_reset_confirm_use_case.dart';

@injectable
class PasswordResetConfirmCubit extends Cubit<BaseState<void>> {
  final PasswordResetConfirmUseCase _confirmUseCase;

  PasswordResetConfirmCubit({
    required PasswordResetConfirmUseCase confirmUseCase,
  }) : _confirmUseCase = confirmUseCase,
       super(BaseState(status: StateStatus.init));

  Future<void> passwordConfirm({
    required PasswordResetConfirmParams params,
  }) async {
    emit(BaseState(status: StateStatus.loading));

    try {
      await _confirmUseCase.execute(params: params);
      emit(BaseState(status: StateStatus.success, model: null));
    } catch (e) {
      emit(BaseState(status: StateStatus.failure, errorMessage: e.toString()));
    }
  }
}
