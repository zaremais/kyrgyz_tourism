import 'package:kyrgyz_tourism/modules/auth/domain/usecases/password_reset_confirm_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/password_reset_use_case.dart';

abstract class AuthDomainPasswordResetdRepository {
  Future<void> passwordReset(PasswordResetParams params);
  Future<void> passwordResetConfirm(PasswordResetConfirmParams params);
}
