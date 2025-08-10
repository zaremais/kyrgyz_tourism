import 'package:dio/dio.dart';
import 'package:kyrgyz_tourism/core/constants/api_urls.dart';
import 'package:kyrgyz_tourism/modules/auth/data/models/telegram_otp_model.dart';
import 'package:kyrgyz_tourism/modules/profile/data/models/profile_model.dart';
import 'package:kyrgyz_tourism/modules/tour/data/models/tour_model.dart';
import 'package:retrofit/retrofit.dart';
part 'auth_api_service.g.dart';

@RestApi(baseUrl: ApiUrls.baseUrl)
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  factory AuthApiService.create({String? botToken}) {
    final dio = Dio();
    if (botToken != null) {
      return AuthApiService(dio, baseUrl: botToken);
    }
    return AuthApiService(dio);
  }
  @POST('/v1/api/sign-up')
  Future<void> signup();

  @POST('/v1/api/sign-in')
  Future<void> signIn();

  @POST('/v1/api/otp/register')
  Future<TelegramOtpModel> sendOtp();

  @GET('/v1/api/profile/me')
  Future<ProfileModel> getProfile();

  @GET('/v1/api/verify')
  Future<void> verifyCode();

  @GET("/v1/api/tours")
  Future<List<TourModel>> getTours({
    @Query("page") required int page,
    @Query("size") required int size,
    @Query("sort") String sort = "averageRating,desc",
  });

  // @GET('/v1/api/guides')
  // Future<PagedResponse<Map<String, dynamic>>> getGuides(
  //   @Query('page') int page,
  //   @Query('size') int size,
  //   @Query('sort') String sort,
  // );
}
