import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/features/tour/data/models/tour_model.dart';
import 'package:kyrgyz_tourism/features/tour/domain/usecases/filter_tours_use_case.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'tour_api_service.g.dart';

@lazySingleton
@RestApi()
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
}
