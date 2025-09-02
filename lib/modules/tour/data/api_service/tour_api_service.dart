import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/constants/api_urls.dart';
import 'package:kyrgyz_tourism/modules/tour/data/models/tour_model.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/usecases/filter_tours_use_case.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'tour_api_service.g.dart';

@RestApi(baseUrl: ApiUrls.baseUrl)
@injectable
abstract class TourApiService {
  @factoryMethod
  factory TourApiService(Dio dio, {@Named("BaseUrl") String baseUrl}) =
      _TourApiService;

  @GET("/v1/api/tours")
  Future<List<TourModel>> getTours({
    @Query("page") int page = 0,
    @Query("size") int size = 10,
    @Query("sort") String sort = "averageRating,desc",
  });

  @GET("/v1/api/tours/individual")
  Future<List<TourModel>> getIndividualTour();

  @POST("/v1/api/tours/filter")
  Future<List<TourModel>> filterTours(@Body() FilterTourParams params);

  // @GET("/v1/api/favorite-tours")
  // Future<List<TourModel>> getFavoriteTours();

  // @POST("/v1/api/favorite-tours/{tourId}")
  // Future<void> addFavoritesTours(@Path('tourId') int tourId);

  // @DELETE("/v1/api/favorite-tours/{tourId}")
  // Future<void> deleteFavoriteTour(@Path('tourId') int tourId);
}
