import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/user_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_repository.dart';

@injectable
class LoginUsecase extends BaseUsecase<UserEntity, LoginParams> {
  final AuthDomainRepository _repository;

  LoginUsecase({required AuthDomainRepository repository})
    : _repository = repository;

  @override
  Future<UserEntity> execute({required params}) {
    try {
      return _repository.login(params);
    } catch (e) {
      rethrow;
    }
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}
