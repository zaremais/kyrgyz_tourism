import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_repository.dart';

@injectable
class LogoutUseCase extends BaseUsecase {
  final AuthDomainRepository _repository;

  LogoutUseCase({required AuthDomainRepository repository})
    : _repository = repository;

  @override
  Future execute({required params}) async {
    await _repository.logout();
  }
}
