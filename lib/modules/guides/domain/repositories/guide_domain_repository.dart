import 'package:kyrgyz_tourism/modules/guides/data/models/paged_response.dart';
import 'package:kyrgyz_tourism/modules/guides/domain/entities/guide_entity.dart';
import 'package:kyrgyz_tourism/modules/guides/domain/usecases/get_guide_use_case.dart';

abstract class GuideDomainRepository {
  Future<PagedResponse<GuideEntity>> getGuides(GuideParams params);
}
