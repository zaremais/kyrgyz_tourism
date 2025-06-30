import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/sign_up_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_repository.dart';

@injectable
class SignupUseCase extends BaseUsecase<SignUpEntity, SignUpParams> {
  final AuthDomainRepository _repository;

  SignupUseCase({required AuthDomainRepository repository})
    : _repository = repository;

  @override
  Future<SignUpEntity> execute({required params}) async {
    try {
      return _repository.signup(params);
    } catch (e) {
      rethrow;
    }
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

  Map<String, dynamic> toJson() {
    return {'email': email, 'nickaname': nickaname, 'password': password};
  }
}
