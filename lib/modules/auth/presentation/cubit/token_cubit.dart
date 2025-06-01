import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/token_einity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/get_toke_use_case.dart';

class TokenCubit extends Cubit<BaseState<TokenEntity>> {
  final GetTokenUserUseCase _getTokenUserUseCase;

  TokenCubit({required GetTokenUserUseCase getTokenUserUseCase})
    : _getTokenUserUseCase = getTokenUserUseCase,
      super(BaseState(status: StateStatus.init));

  Future<void> getToken() async {
    emit(BaseState(status: StateStatus.loading));
    try {
      final result = await _getTokenUserUseCase.execute(params: state.model);
      emit(BaseState(status: StateStatus.success, model: result));
    } catch (e) {
      emit(BaseState(status: StateStatus.error));
    }
  }
}
