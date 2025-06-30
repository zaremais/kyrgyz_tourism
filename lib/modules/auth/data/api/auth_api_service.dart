import 'package:dio/dio.dart';
import 'package:kyrgyz_tourism/core/constants/api_urls.dart';
import 'package:kyrgyz_tourism/modules/auth/data/models/sign_in_model.dart';
import 'package:kyrgyz_tourism/modules/auth/data/models/sign_up_model.dart';
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
  @POST('api/sign-up')
  Future<void> signup(@Body() SignUpModel request);

  @POST('/api/sign-in')
  Future<void> signin(@Body() SignInModel request);

  @POST('/api/otp')
  Future<void> sendMessage(
    // @Body() TelegramModel request
  );

  @GET('/api/verify')
  Future<void> verifyOtp();
}
