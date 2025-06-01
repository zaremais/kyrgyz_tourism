import 'package:kyrgyz_tourism/modules/auth/domain/entities/token_einity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/user_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/login_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/register_use_case.dart';

abstract class AuthDomainRepository {
  Future<UserEntity> register(RegisterParams params);
  Future<UserEntity> login(LoginParams params);
  Future<void> logout();
  Future<UserEntity?> getCurrentUser();
  Future<TokenEntity> getToken();
}
