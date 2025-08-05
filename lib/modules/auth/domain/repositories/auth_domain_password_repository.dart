import 'package:kyrgyz_tourism/modules/auth/domain/entities/reset_password_result.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/reset_password_use_case.dart';

abstract class AuthDomainPasswordRepository {
  Future<ResetPasswordResult> resetPassword(ResetPasswordParams params);
  Future<ResetPasswordResult> resetPasswordConfirm(ResetPasswordParams params);
}
