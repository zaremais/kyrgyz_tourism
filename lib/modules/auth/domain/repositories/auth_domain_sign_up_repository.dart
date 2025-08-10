import 'package:kyrgyz_tourism/modules/auth/domain/entities/sign_up_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/check_nickname_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/sign_up_use_case.dart';

abstract class AuthDomainSignUpRepository {
  Future<SignUpEntity> signup(SignUpParams params);
  Future<bool> checkNickname(NickNameParams params);
  // Future<UserEntity> getCurrentUser();
  Future<bool> verifyCode(String code);
}
