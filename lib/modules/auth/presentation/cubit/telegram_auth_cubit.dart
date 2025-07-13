import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/core/network/storage_secure_storage/storage_secure_service.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/telegram_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/send_otp_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/confirm_otp_use_case.dart';

@injectable
class TelegramAuthCubit extends Cubit<BaseState<TelegramEntity>> {
  final SendOtpUseCase _sendOtpUseCase;
  final ConfirmOtpUseCase _confirmOtpUseCase;
  Timer? _timer;
  int _secondsRemaining = 0;

  TelegramAuthCubit({
    required SendOtpUseCase sendOtpUseCase,
    required ConfirmOtpUseCase confirmOtpUseCase,
  }) : _sendOtpUseCase = sendOtpUseCase,
       _confirmOtpUseCase = confirmOtpUseCase,
       super(BaseState(status: StateStatus.init, secondsRemaining: 0));

  int get secondsRemaining => _secondsRemaining;

  Future<void> sendOtp({required SendOtpParams params}) async {
    emit(BaseState(status: StateStatus.loading));
    try {
      final result = await _sendOtpUseCase.execute(params: params);

      log('OTP CODE: ${result.otp}');
      _startTimer();
      emit(
        BaseState(
          status: StateStatus.success,
          model: result,
          otpCode: result.otp,
          secondsRemaining: _secondsRemaining,
          isOtpConfirmed: false,
        ),
      );
    } catch (e) {
      emit(BaseState(status: StateStatus.error, errorMessage: e.toString()));
    }
  }

  Future<void> confirmOtp({required ConfirmOtpParams params}) async {
    emit(BaseState(status: StateStatus.loading));

    final username = state.model?.username;
    if (username == null || username.isEmpty) {
      emit(
        BaseState(
          status: StateStatus.error,
          errorMessage: 'Username не найден',
        ),
      );
      return;
    }

    try {
      final result = await _confirmOtpUseCase.execute(params: params);
      await SecureStorage().saveAccessToken(result.accessToken.toString());
      emit(
        BaseState(
          status: StateStatus.success,
          model: result,
          isOtpConfirmed: true,
        ),
      );
    } catch (e) {
      emit(BaseState(status: StateStatus.error, errorMessage: e.toString()));
    }
  }

  void _startTimer() {
    _secondsRemaining = 60;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _secondsRemaining--;
      if (_secondsRemaining == 0) {
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
