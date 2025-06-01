import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/modules/users/domain/entities/entity.dart';
import 'package:kyrgyz_tourism/modules/users/domain/repositories/users_domain_repository.dart';

@injectable
class GetUserUseCase extends BaseUsecase {
  final UsersDomainRepository _repository;

  GetUserUseCase({required UsersDomainRepository repository})
    : _repository = repository;

  @override
  Future<List<UsersEntity>> execute({required params}) {
    return _repository.getUsers();
  }
}
