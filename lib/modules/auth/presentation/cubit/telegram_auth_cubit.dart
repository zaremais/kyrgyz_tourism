import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/telegram_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/send_phone_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/otp_confirm_use_case.dart';

@injectable
class TelegramAuthCubit extends Cubit<BaseState<TelegramEntity>> {
  final SendPhoneUseCase _sendOtpUseCase;
  final OtpConfirmUseCase _otpVerifyUseCase;
  Timer? _timer;
  final int _secondsRemaining = 0;

  TelegramAuthCubit({
    required SendPhoneUseCase sendOtpUseCase,
    required OtpConfirmUseCase otpVerifyUseCase,
  }) : _sendOtpUseCase = sendOtpUseCase,
       _otpVerifyUseCase = otpVerifyUseCase,
       super(BaseState(status: StateStatus.init));

  int get secondsRemaining => _secondsRemaining;

  Future<void> verifyOtp(
    String phoneNamber,
    String otp, {
    required OtpConfirmParams params,
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
            otp: '7620',
            chatId: 9007199254740991,
            rawPassword: '',
            username: 'user_scadov',
            refreshToken:
                'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwicm9sZSI6WyJST0xFX1VTRVIiXSwibmlja25hbWUiOiJ1c2VyX3NjYWRvdiIsImlzcyI6InRvdXItYXBwIiwiZXhwIjoxNzUzMjg2OTQyLCJpYXQiOjE3NTE5OTA5NDIsImVtYWlsIjpudWxsfQ.DrueIZ-B4fBp5WaiBOfSVP9GLhVqIWpfYUeZADDMZog',

            accessToken:
                'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwicm9sZSI6WyJST0xFX1VTRVIiXSwibmlja25hbWUiOiJ1c2VyX3NjYWRvdiIsImlzcyI6InRvdXItYXBwIiwiZXhwIjoxNzUxOTk0NTQyLCJpYXQiOjE3NTE5OTA5NDIsImVtYWlsIjpudWxsfQ.m-lwxHKTQYdS-IX4Mc2Q7OO-Nj_Lte4vuEHvouTL1Uo',
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
      // _startTimer();

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
}
