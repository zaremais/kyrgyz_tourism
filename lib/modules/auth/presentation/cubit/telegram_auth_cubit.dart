import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/telegram_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/send_phone_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/verify_otp_use_case.dart';

@injectable
class TelegramAuthCubit extends Cubit<BaseState<TelegramEntity>> {
  final SendPhoneUseCase _sendOtpUseCase;
  final VerifyOtpUseCase _otpVerifyUseCase;
  Timer? _timer;
  int _secondsRemaining = 0;

  TelegramAuthCubit({
    required SendPhoneUseCase sendOtpUseCase,
    required VerifyOtpUseCase otpVerifyUseCase,
  }) : _sendOtpUseCase = sendOtpUseCase,
       _otpVerifyUseCase = otpVerifyUseCase,
       super(BaseState(status: StateStatus.init));

  int get secondsRemaining => _secondsRemaining;

  Future<void> verifyOtp(
    String phoneNamber,
    String otpCode, {
    required VerifyOtpParams params,
  }) async {
    emit(BaseState(status: StateStatus.loading));
    try {
      await _otpVerifyUseCase.execute(params: params);
      _timer?.cancel();
      emit(
        BaseState(
          status: StateStatus.success,
          model: TelegramEntity(
            isVerified: true,
            phoneNumber: phoneNamber,
            otpCode: otpCode,
            chatId: '',
          ),
        ),
      );
    } catch (e) {
      emit(BaseState(status: StateStatus.error, error: e.toString()));
    }
  }

  Future<void> sendPhoneNumber(
    String phoneNamber, {
    required SendOtpParams params,
  }) async {
    emit(BaseState(status: StateStatus.loading));
    try {
      await _sendOtpUseCase.execute(params: params);
      _startTimer();

      emit(
        BaseState(
          status: StateStatus.success,
          secondsRemaining: _secondsRemaining,
        ),
      );
    } catch (e) {
      emit(BaseState(status: StateStatus.error, error: e.toString()));
    }
  }

  void _startTimer() {
    _secondsRemaining = 60;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _secondsRemaining--;
      emit(
        BaseState(
          status: StateStatus.success,
          secondsRemaining: _secondsRemaining,
        ),
      );
      if (_secondsRemaining <= 0) {
        _timer?.cancel();
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
