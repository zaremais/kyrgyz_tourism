import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_sign_up_repository.dart';

@injectable
class VerifyCodeUseCase extends BaseUsecase<bool, VerifyCodeParams> {
  final AuthDomainSignUpRepository _repository;

  VerifyCodeUseCase({required AuthDomainSignUpRepository repository})
    : _repository = repository;

  @override
  Future<bool> execute({required VerifyCodeParams params}) async {
    return await _repository.verifyCode(params);
  }
}

class VerifyCodeParams {
  final String code;

  VerifyCodeParams({required this.code});

  JSON toJson() {
    return {"code": code};
  }
}
