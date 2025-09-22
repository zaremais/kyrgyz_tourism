import 'package:kyrgyz_tourism/features/guides/domain/entities/guide_entity.dart';
import 'package:kyrgyz_tourism/features/guides/domain/usecases/get_guide_use_case.dart';

abstract class GuideDomainRepository {
  Future<List<GuideEntity>> getGuides(GuideParams params);
  Future<GuideEntity?> getGuideById(int id);
}
