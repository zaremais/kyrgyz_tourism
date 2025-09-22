import 'package:kyrgyz_tourism/features/auth/domain/entities/sign_up_entity.dart';
import 'package:kyrgyz_tourism/features/auth/domain/usecases/check_nickname_use_case.dart';
import 'package:kyrgyz_tourism/features/auth/domain/usecases/sign_up_use_case.dart';
import 'package:kyrgyz_tourism/features/auth/domain/usecases/verify_code_use_case.dart';

abstract class AuthDomainSignUpRepository {
  Future<SignUpEntity> signup(SignUpParams params);
  Future<bool> checkNickname(CheckNickNameParams params);
  Future<bool> verifyCode(VerifyCodeParams params);
}
