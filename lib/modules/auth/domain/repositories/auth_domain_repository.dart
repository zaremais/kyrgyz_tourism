import 'package:kyrgyz_tourism/modules/auth/domain/entities/sign_in_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/sign_up_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/send_phone_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/sign_in_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/signup_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/verify_otp_use_case.dart';

abstract class AuthDomainRepository {
  Future<SignInEntity> signin(SignInParams params);
  Future<SignUpEntity> signup(SignUpParams params);
  Future<bool> isLoggedIn();
  Future<void> sendPhoneNumber(SendOtpParams params);
  Future<void> verifyOtp(VerifyOtpParams params);
}
