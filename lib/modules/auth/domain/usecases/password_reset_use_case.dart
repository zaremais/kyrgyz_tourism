import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_password_reset_repository.dart';

@injectable
class PasswordResetUseCase extends BaseUsecase<void, PasswordResetParams> {
  final AuthDomainPasswordResetdRepository _repository;

  PasswordResetUseCase({required AuthDomainPasswordResetdRepository repository})
    : _repository = repository;

  @override
  Future<void> execute({required PasswordResetParams params}) async {
    return _repository.passwordReset(params);
  }
}

class PasswordResetParams {
  final String email;

  PasswordResetParams({required this.email});

  JSON toJson() => {"email": email};
}
