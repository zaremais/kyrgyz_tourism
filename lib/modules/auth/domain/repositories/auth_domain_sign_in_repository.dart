import 'package:kyrgyz_tourism/modules/auth/domain/entities/sign_in_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/refresh_token_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/sign_in_use_case.dart';

abstract class AuthDomainSignInRepository {
  Future<SignInEntity> signIn(SignInParams params);
  Future<SignInEntity> refreshToken(RefreshParams params);
  Future<bool> getRememberMe();
}
