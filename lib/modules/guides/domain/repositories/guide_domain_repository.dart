import 'package:kyrgyz_tourism/modules/guides/data/models/paged_response.dart';
import 'package:kyrgyz_tourism/modules/guides/domain/entities/guide_entity.dart';

abstract class GuideDomainRepository {
  Future<PagedResponse<GuideEntity>> getGuides(int size, int page, String sort);
}
