import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/sign_in_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/get_remembe_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/refresh_token_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/sign_in_use_case.dart';

@injectable
class SignInCubit extends Cubit<BaseState<SignInEntity>> {
  final SignInUsecase _signInUsecase;
  final RefreshTokenUseCase _refreshTokenUseCase;
  final GetRemembeUseCase _getRemembeUseCase;

  SignInCubit({
    required SignInUsecase signInUsecase,
    required RefreshTokenUseCase refreshTokenUseCase,
    required GetRemembeUseCase getRememberUseCase,
  }) : _signInUsecase = signInUsecase,
       _refreshTokenUseCase = refreshTokenUseCase,
       _getRemembeUseCase = getRememberUseCase,
       super(BaseState(status: StateStatus.init));

  Future<void> signin({required SignInParams params}) async {
    emit(BaseState(status: StateStatus.loading));
    try {
      final result = await _signInUsecase.execute(params: params);
      emit(BaseState(status: StateStatus.success, model: result));
    } catch (e) {
      emit(BaseState(status: StateStatus.failure, errorMessage: e.toString()));
    }
  }

  Future<void> refreshToken({required RefreshParams params}) async {
    emit(BaseState(status: StateStatus.loading));
    try {
      final result = await _refreshTokenUseCase.execute(params: params);
      emit(BaseState(status: StateStatus.success, model: result));
    } catch (e) {
      emit(BaseState(status: StateStatus.failure, errorMessage: e.toString()));
    }
  }

  Future<void> loadRememberMe() async {
    emit(BaseState(status: StateStatus.loading));
    try {
      await _getRemembeUseCase.execute(params: NoParams());
      emit(BaseState(status: StateStatus.success, model: state.model));
    } catch (e) {
      emit(BaseState(status: StateStatus.failure, errorMessage: e.toString()));
    }
  }
}
