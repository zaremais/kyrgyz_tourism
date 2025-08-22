import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/constants/api_urls.dart';
import 'package:kyrgyz_tourism/modules/guides/data/models/guide_model.dart';
import 'package:kyrgyz_tourism/modules/guides/data/models/paged_response.dart';
import 'package:retrofit/retrofit.dart';

part 'guide_api_service.g.dart';

@RestApi(baseUrl: ApiUrls.baseUrl)
@injectable
abstract class GuideApiService {
  @factoryMethod
  factory GuideApiService(Dio dio, {@Named("BaseUrl") String baseUrl}) =
      _GuideApiService;

  @GET("/v1/api/guides")
  Future<PagedResponse<GuideModel>> getGuides({
    @Query("page") int page = 0,
    @Query("size") int size = 10,
    @Query("sort") String sort = "id,desc",
  });
}
