import 'package:dio/dio.dart';
import 'package:kyrgyz_tourism/core/constants/api_urls.dart';
import 'package:kyrgyz_tourism/modules/auth/data/models/telegram_model.dart';
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
  Future<void> signin();

  @POST('/v1/api/otp/link')
  Future<TelegramModel> sendOtp(
    // @Body() TelegramModel request
  );

  @POST('/v1/api/verify')
  Future<void> verifyOtp();
}
