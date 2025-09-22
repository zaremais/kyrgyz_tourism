import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';

import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/features/auth/domain/usecases/check_nickname_use_case.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class CheckNicknameCubit extends Cubit<BaseState<bool>> {
  final CheckNicknameUseCase _checkNicknameUseCase;
  final _nicknameSubject = BehaviorSubject<String>();
  late final StreamSubscription _subscription;

  CheckNicknameCubit({required CheckNicknameUseCase checkNicknameUseCase})
    : _checkNicknameUseCase = checkNicknameUseCase,
      super(BaseState(status: StateStatus.init)) {
    _subscription = _nicknameSubject
        .distinct()
        .debounceTime(const Duration(milliseconds: 500))
        .listen((nickname) {
          _checkNickname(CheckNickNameParams(nickname: nickname));
        });
  }

  void checkNickname(CheckNickNameParams params) {
    final trimmed = params.nickname.trim();

    _nicknameSubject.add(params.nickname.trim());
    if (trimmed.isEmpty) {
      emit(BaseState(status: StateStatus.init));
      return;
    }
    _nicknameSubject.add(trimmed);
  }

  Future<void> _checkNickname(CheckNickNameParams params) async {
    emit(BaseState(status: StateStatus.loading));
    try {
      final isTaken = await _checkNicknameUseCase.execute(params: params);
      emit(BaseState(status: StateStatus.success, model: isTaken));
    } catch (e) {
      emit(BaseState(status: StateStatus.failure, errorMessage: e.toString()));
    }
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    _nicknameSubject.close();
    return super.close();
  }
}
