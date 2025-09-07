import 'package:dio/dio.dart' hide Headers;
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/modules/reviews/data/models/reviews_model.dart';
import 'package:kyrgyz_tourism/modules/reviews/domain/usecases/add_reviews_use_case.dart';
import 'package:retrofit/retrofit.dart';

part 'reviews_api_service.g.dart';

@RestApi(baseUrl: 'http://34.18.76.114')
@injectable
abstract class ReviewsApiService {
  @factoryMethod
  factory ReviewsApiService(Dio dio, {@Named("BaseUrl") String baseUrl}) =
      _ReviewsApiService;

  @GET('/v1/api/reviews')
  Future<List<ReviewsModel>> getReviews();

  @POST('/v1/api/reviews')
  Future<void> addReviews(@Body() AddReviewsParams params);
}
