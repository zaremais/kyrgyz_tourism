import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/features/categories/domain/entities/contact_entity.dart';
import 'package:kyrgyz_tourism/features/categories/domain/repositories/contact_domain_repository.dart';

@injectable
class GetContactUseCase extends BaseUsecase<ContactEntity, NoParams> {
  final ContactDomainRepository _repository;

  GetContactUseCase({required ContactDomainRepository repository})
    : _repository = repository;

  @override
  Future<ContactEntity> execute({required NoParams params}) async {
    return await _repository.getContact();
  }
}
