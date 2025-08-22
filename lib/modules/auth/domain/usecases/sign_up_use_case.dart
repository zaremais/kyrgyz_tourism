import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/sign_up_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_sign_up_repository.dart';

@LazySingleton()
class SignupUseCase extends BaseUsecase<SignUpEntity, SignUpParams> {
  final AuthDomainSignUpRepository _repository;

  SignupUseCase({required AuthDomainSignUpRepository repository})
    : _repository = repository;

  @override
  Future<SignUpEntity> execute({required SignUpParams params}) async {
    return await _repository.signup(params);
  }
}

class SignUpParams {
  final String email;
  final String nickaname;
  final String password;

  SignUpParams({
    required this.email,
    required this.nickaname,
    required this.password,
  });

  JSON toJson() {
    return {'email': email, 'nickaname': nickaname, 'password': password};
  }
}
