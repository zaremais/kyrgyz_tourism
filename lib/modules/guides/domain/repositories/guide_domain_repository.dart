import 'package:kyrgyz_tourism/modules/guides/domain/entities/guide_entity.dart';

abstract class GuideDomainRepository {
  Future<List<GuideEntity>> getGuide();
}
