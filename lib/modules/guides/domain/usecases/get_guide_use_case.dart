import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/modules/guides/domain/entities/guide_entity.dart';
import 'package:kyrgyz_tourism/modules/guides/domain/repositories/guide_domain_repository.dart';

@injectable
class GetGuideUseCase extends BaseUsecase<List<GuideEntity>, void> {
  final GuideDomainRepository _repository;

  GetGuideUseCase({required GuideDomainRepository repository})
    : _repository = repository;

  @override
  Future<List<GuideEntity>> execute({params}) async {
    return _repository.getGuide();
  }
}
