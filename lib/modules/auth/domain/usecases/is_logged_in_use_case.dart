import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_repository.dart';

@injectable
class IsLoggedInUseCase extends BaseUsecase<bool, dynamic> {
  final AuthDomainRepository _repository;

  IsLoggedInUseCase({required AuthDomainRepository repository})
    : _repository = repository;

  @override
  Future<bool> execute({required params}) async {
    try {
      return _repository.isLoggedIn();
    } catch (e) {
      rethrow;
    }
  }
}
