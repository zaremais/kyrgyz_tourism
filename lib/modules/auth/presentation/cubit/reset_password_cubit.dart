import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/reset_password_result.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/reset_password_use_case.dart';

@injectable
class ResetPasswordCubit extends Cubit<BaseState<ResetPasswordResult>> {
  final ResetPasswordUseCase _resetPasswordUseCase;

  ResetPasswordCubit({required ResetPasswordUseCase resetPasswordUseCase})
    : _resetPasswordUseCase = resetPasswordUseCase,
      super(BaseState(status: StateStatus.init));

  Future<void> resetPassword({required ResetPasswordParams params}) async {
    emit(BaseState(status: StateStatus.loading));
    try {
      final result = await _resetPasswordUseCase.execute(params: params);
      emit(BaseState(status: StateStatus.success, model: result));
    } catch (e) {
      emit(BaseState(status: StateStatus.failure, errorMessage: e.toString()));
    }
  }
}
