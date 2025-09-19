import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/modules/auth/data/api_service/auth_api_service.dart';
import 'package:kyrgyz_tourism/modules/auth/data/models/password_reset_model.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/reset_password_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_password_reset_repository.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/password_reset_confirm_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/password_reset_use_case.dart';

@LazySingleton(as: AuthDomainPasswordResetdRepository)
class AuthPasswordResetRepository extends AuthDomainPasswordResetdRepository {
  final AuthApiService _api;

  AuthPasswordResetRepository({required AuthApiService api}) : _api = api;

  @override
  Future<PasswordResetModel> passwordResetConfirm(
    PasswordResetConfirmParams params,
  ) async {
    await _api.passwordResetConfirm(params);
    throw UnimplementedError(
      'API returns String but PasswordResetModel expected',
    );
  }

  @override
  Future<PasswordResetEntity> resetPassword(PasswordResetParams params) async {
    await _api.passwordReset(params.email);
    throw UnimplementedError(
      'API returns String but PasswordResetModel expected',
    );
  }
}
