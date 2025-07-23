import 'package:kyrgyz_tourism/modules/auth/domain/entities/reset_password_result.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/sign_in_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/sign_up_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/telegram_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/reset_password_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/send_otp_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/sign_in_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/sign_up_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/confirm_otp_use_case.dart';

abstract class AuthDomainRepository {
  Future<SignInEntity> login(SignInParams params);
  Future<SignUpEntity> signup(SignUpParams params);
  Future<bool> isLoggedIn();
  Future<TelegramEntity> sendOtp(SendOtpParams params);
  Future<TelegramEntity> confirmOtp(ConfirmOtpParams params);
  Future<ResetPasswordResult> resetPassword(ResetPasswordParams params);
  Future<String> getTelegramBotLink();
}
