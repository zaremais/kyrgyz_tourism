import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/sign_up_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/sign_up_use_case.dart';

@injectable
class SignUpCubit extends Cubit<BaseState<SignUpEntity>> {
  final SignupUseCase _signupUseCase;

  SignUpCubit(SignupUseCase signupUseCase)
    : _signupUseCase = signupUseCase,

      super(BaseState(status: StateStatus.init));

  Future<void> signup(SignUpParams params) async {
    emit(BaseState(status: StateStatus.loading));
    try {
      final user = await _signupUseCase.execute(params: params);

      emit(BaseState(status: StateStatus.success, model: user));
    } catch (e) {
      emit(BaseState(status: StateStatus.failure, errorMessage: e.toString()));
    }
  }
}
