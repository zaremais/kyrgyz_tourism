import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_sign_in_repository.dart';

@injectable
class GetRemembeUseCase extends BaseUsecase<bool, NoParams> {
  final AuthDomainSignInRepository _repository;

  GetRemembeUseCase({required AuthDomainSignInRepository repository})
    : _repository = repository;

  @override
  Future<bool> execute({required NoParams params}) async {
    return await _repository.getRememberMe();
  }
}
