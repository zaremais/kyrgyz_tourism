import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/token_einity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_repository.dart';

@injectable
class GetTokenUserUseCase extends BaseUsecase {
  final AuthDomainRepository _repository;

  GetTokenUserUseCase({required AuthDomainRepository repository})
    : _repository = repository;

  @override
  Future<TokenEntity> execute({required params}) async {
    return await _repository.getToken();
  }
}
