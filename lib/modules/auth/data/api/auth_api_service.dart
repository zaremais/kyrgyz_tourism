import 'package:dio/dio.dart';
import 'package:kyrgyz_tourism/core/constants/api_urls.dart';
import 'package:kyrgyz_tourism/modules/auth/data/models/user_model.dart';
import 'package:retrofit/retrofit.dart';
part 'auth_api_service.g.dart';

@RestApi(baseUrl: ApiUrls.baseURL)
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST('/login')
  Future<void> login(@Body() UserModel request);

  @POST('/register')
  Future<void> register(@Body() UserModel request);

  @GET('/users')
  Future<void> getUser();
}
