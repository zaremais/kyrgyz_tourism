import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/features/auth/domain/usecases/verify_code_use_case.dart';

@injectable
class VerifyCodeCubit extends Cubit<BaseState<bool>> {
  final VerifyCodeUseCase _verifyCodeUseCase;

  VerifyCodeCubit({required VerifyCodeUseCase verifyCodeUseCase})
    : _verifyCodeUseCase = verifyCodeUseCase,
      super(BaseState(status: StateStatus.init));

  Future<void> verifyCode(VerifyCodeParams params) async {
    emit(BaseState(status: StateStatus.loading));

    try {
      await _verifyCodeUseCase.execute(params: params);
      emit(BaseState(status: StateStatus.success, model: state.model));
    } catch (e) {
      emit(BaseState(status: StateStatus.failure, errorMessage: e.toString()));
    }
  }
}
