import 'package:kyrgyz_tourism/features/auth/domain/entities/reset_password_entity.dart';
import 'package:kyrgyz_tourism/features/auth/domain/usecases/password_reset_confirm_use_case.dart';
import 'package:kyrgyz_tourism/features/auth/domain/usecases/password_reset_use_case.dart';

abstract class AuthDomainPasswordResetdRepository {
  Future<PasswordResetEntity> resetPassword(PasswordResetParams params);
  Future<PasswordResetEntity> passwordResetConfirm(
    PasswordResetConfirmParams params,
  );
}
