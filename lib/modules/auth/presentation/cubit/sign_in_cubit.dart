import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/sign_in_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/sign_in_use_case.dart';

@injectable
class SignInCubit extends Cubit<BaseState<SignInEntity>> {
  final SignInUsecase _signInUsecase;

  SignInCubit({required SignInUsecase signInUsecase})
    : _signInUsecase = signInUsecase,
      super(BaseState(status: StateStatus.init));

  Future<void> signin({required params}) async {
    emit(BaseState(status: StateStatus.loading));
    try {
      final user = await _signInUsecase.execute(params: params);
      emit(BaseState(status: StateStatus.success, model: user));
    } catch (e) {
      emit(BaseState(status: StateStatus.error, error: e.toString()));
    }
  }
}
