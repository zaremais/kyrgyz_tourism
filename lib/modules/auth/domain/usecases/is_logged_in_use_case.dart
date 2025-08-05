import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_sign_in_repository.dart';

@injectable
class IsLoggedInUseCase extends BaseUsecase<bool, NoParams> {
  final AuthDomainSignInRepository _repository;

  IsLoggedInUseCase({required AuthDomainSignInRepository repository})
    : _repository = repository;

  @override
  Future<bool> execute({required NoParams params}) {
    return _repository.isLoggedIn();
  }
}
