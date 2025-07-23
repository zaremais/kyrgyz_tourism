import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/sign_in_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_repository.dart';

@injectable
class SignInUsecase extends BaseUsecase<SignInEntity, SignInParams> {
  final AuthDomainRepository _repository;

  SignInUsecase({required AuthDomainRepository repository})
    : _repository = repository;

  @override
  Future<SignInEntity> execute({required SignInParams params}) async {
    return await _repository.login(params);
  }
}

class SignInParams {
  final String identifier;
  final String password;

  SignInParams({required this.identifier, required this.password});

  Map<String, dynamic> toJson() => {
    'identifier': identifier,
    'password': password,
  };
}
