import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/modules/profile/domain/entities/profile_entity.dart';
import 'package:kyrgyz_tourism/modules/profile/domain/repositories/profile_domain_repository.dart';

@injectable
class GetProfileUseCase extends BaseUsecase {
  final ProfileDomainRepository _repository;

  GetProfileUseCase({required ProfileDomainRepository repository})
    : _repository = repository;

  @override
  Future<ProfileEntity> execute({required params}) {
    return _repository.getProfile();
  }
}
