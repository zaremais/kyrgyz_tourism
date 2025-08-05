import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/reset_password_result.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_password_repository.dart';

@injectable
class ResetPasswordUseCase
    extends BaseUsecase<ResetPasswordResult, ResetPasswordParams> {
  final AuthDomainPasswordRepository _repository;

  ResetPasswordUseCase({required AuthDomainPasswordRepository repository})
    : _repository = repository;

  @override
  Future<ResetPasswordResult> execute({
    required ResetPasswordParams params,
  }) async {
    return _repository.resetPassword(params);
  }
}

class ResetPasswordParams {
  final String email;

  ResetPasswordParams({required this.email});

  JSON toJson() => {"email": email};
}
