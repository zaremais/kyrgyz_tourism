import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_is_logged_in.dart';

@injectable
class IsLoggedInUseCase extends BaseUsecase<bool, NoParams> {
  final AuthDomainIsLoggedInRepository _repository;

  IsLoggedInUseCase({required AuthDomainIsLoggedInRepository repository})
    : _repository = repository;

  @override
  Future<bool> execute({required params}) async {
    return _repository.isLoggedIn();
  }
}
