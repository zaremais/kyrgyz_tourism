import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/modules/guides/domain/entities/guide_entity.dart';
import 'package:kyrgyz_tourism/modules/guides/domain/repositories/guide_domain_repository.dart';

@injectable
class GetGuideUseCase extends BaseUsecase<List<GuideEntity>, GuideParams> {
  final GuideDomainRepository _repository;

  GetGuideUseCase({required GuideDomainRepository repository})
    : _repository = repository;

  @override
  Future<List<GuideEntity>> execute({required GuideParams params}) async {
    return _repository.getGuides(params);
  }
}

class GuideParams {
  final int size;
  final int page;
  final String sort;

  GuideParams({required this.size, required this.page, required this.sort});

  JSON toJson() {
    return {'size': size, 'page': page, 'sort': sort};
  }
}
