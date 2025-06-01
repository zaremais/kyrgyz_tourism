import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/user_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_repository.dart';

@injectable
class GetCurrentUserUseCase extends BaseUsecase {
  final AuthDomainRepository _repository;

  GetCurrentUserUseCase({required AuthDomainRepository repository})
    : _repository = repository;

  @override
  Future<UserEntity?> execute({required params}) async {
    return await _repository.getCurrentUser();
  }
}
