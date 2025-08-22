import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/modules/guides/data/api_service/guide_api_service.dart';
import 'package:kyrgyz_tourism/modules/guides/data/models/guide_model.dart';
import 'package:kyrgyz_tourism/modules/guides/data/models/paged_response.dart';
import 'package:kyrgyz_tourism/modules/guides/domain/repositories/guide_domain_repository.dart';
import 'package:kyrgyz_tourism/modules/guides/domain/usecases/get_guide_use_case.dart';

@LazySingleton(as: GuideDomainRepository)
class GuideRepository extends GuideDomainRepository {
  final GuideApiService _guideApi;

  GuideRepository({required GuideApiService guideApi}) : _guideApi = guideApi;

  @override
  Future<PagedResponse<GuideModel>> getGuides(GuideParams params) async {
    final response = await _guideApi.getGuides(
      page: params.page,
      size: params.size,
      sort: params.sort,
    );
    return response;
  }
}
