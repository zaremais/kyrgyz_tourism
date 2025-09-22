import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/features/auth/domain/entities/reset_password_entity.dart';
import 'package:kyrgyz_tourism/features/auth/domain/repositories/auth_domain_password_reset_repository.dart';

@injectable
class PasswordResetConfirmUseCase
    extends BaseUsecase<PasswordResetEntity, PasswordResetConfirmParams> {
  final AuthDomainPasswordResetdRepository _repository;

  PasswordResetConfirmUseCase({
    required AuthDomainPasswordResetdRepository repository,
  }) : _repository = repository;

  @override
  Future<PasswordResetEntity> execute({
    required PasswordResetConfirmParams params,
  }) async {
    return await _repository.passwordResetConfirm(params);
  }
}

class PasswordResetConfirmParams {
  final String token;
  final String newPassword;

  PasswordResetConfirmParams({required this.token, required this.newPassword});

  JSON toJson() {
    return {'token': token, 'newPassword': newPassword};
  }
}
