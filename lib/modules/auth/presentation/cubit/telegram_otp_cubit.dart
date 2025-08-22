import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/telegram_otp_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/get_otp_link_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/register_otp_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/telegram_confirm_use_case.dart';

@injectable
class TelegramOtpCubit extends Cubit<BaseState<TelegramOtpEntity>> {
  final RegisterOtpUseCase _registerOtpUseCase;

  final GetOtpLinkUseCase _getOtpLinkUseCase;
  Timer? _timer;
  int _secondsRemaining = 0;

  TelegramOtpCubit({
    required RegisterOtpUseCase sendOtpUseCase,
    required TelegramConfirmUseCase confirmOtpUseCase,
    required GetOtpLinkUseCase getOtpLinkUseCase,
  }) : _registerOtpUseCase = sendOtpUseCase,

       _getOtpLinkUseCase = getOtpLinkUseCase,
       super(BaseState(status: StateStatus.init, secondsRemaining: 0));

  int get secondsRemaining => _secondsRemaining;

  Future<void> sendOtp({required RegisterOtpParams params}) async {
    emit(BaseState(status: StateStatus.loading));
    try {
      final result = await _registerOtpUseCase.execute(params: params);

      _startTimer();

      emit(
        BaseState(
          status: StateStatus.success,
          model: result,
          // otpCode: result.otp,
          secondsRemaining: _secondsRemaining,
          // isOtpConfirmed: false,
        ),
      );
    } catch (e) {
      emit(BaseState(status: StateStatus.failure, errorMessage: e.toString()));
    }
  }

  Future<void> getTelegramBotLink() async {
    emit(BaseState(status: StateStatus.loading));
    try {
      await _getOtpLinkUseCase.execute(params: NoParams());

      emit(BaseState(status: StateStatus.success, model: state.model));
    } catch (e) {
      emit(BaseState(status: StateStatus.failure, errorMessage: e.toString()));
    }
  }

  void _startTimer() {
    const duration = 60;
    _secondsRemaining = duration;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _secondsRemaining--;
      if (_secondsRemaining <= 0) {
        timer.cancel();
        emit(BaseState(status: StateStatus.init));
      } else {
        emit(
          BaseState(
            status: StateStatus.success,
            secondsRemaining: _secondsRemaining,
          ),
        );
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
