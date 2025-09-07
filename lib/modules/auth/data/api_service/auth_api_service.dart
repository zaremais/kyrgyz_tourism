import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/password_reset_confirm_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/refresh_token_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/register_otp_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/sign_in_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/sign_up_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/telegram_confirm_use_case.dart';
import 'package:retrofit/retrofit.dart';

import '../models/sign_in_model.dart';
import '../models/sign_up_model.dart';
import '../models/telegram_otp_model.dart';
import '../models/telegram_confirm_model.dart';

part 'auth_api_service.g.dart';

@lazySingleton
@RestApi()
abstract class AuthApiService {
  @factoryMethod
  factory AuthApiService(Dio dio, {@Named("BaseUrl") String baseUrl}) =
      _AuthApiService;

  @POST('/v1/api/sign-up')
  Future<SignUpModel> signup(@Body() SignUpParams params);

  @GET('/v1/api/verify')
  Future<void> verifyCode(@Query('code') String code);

  @GET('/v1/api/exists/{nickname}')
  Future<bool> checkNickname(@Path('nickname') String nickname);

  @POST('/v1/api/sign-in')
  Future<SignInModel> signIn(@Body() SignInParams params);

  @POST('/v1/api/refresh')
  Future<SignInModel> refreshToken(@Body() RefreshParams params);

  @POST('/v1/api/otp/register')
  Future<TelegramOtpModel> registerOtp(@Body() RegisterOtpParams params);

  @POST('/v1/api/otp/confirm')
  Future<TelegramConfirmModel> confirmOtp(@Body() ConfirmOtpParams params);

  @GET('/v1/api/otp/link{link}')
  Future<String> getOtpLink(@Path('link') String link);

  @POST('/v1/api/password-reset/{email}')
  Future<String> passwordReset(@Query('email') String email);

  @POST('/v1/api/password-reset/confirm')
  Future<String> passwordResetConfirm(
    @Body() PasswordResetConfirmParams params,
  );
}

// import 'dart:io';

// import 'package:dio/dio.dart' hide Headers;
// import 'package:kyrgyz_tourism/core/constants/api_urls.dart';
// import 'package:kyrgyz_tourism/modules/auth/data/models/sign_in_model.dart';
// import 'package:kyrgyz_tourism/modules/auth/data/models/sign_up_model.dart';
// import 'package:kyrgyz_tourism/modules/auth/data/models/telegram_confirm_model.dart';
// import 'package:kyrgyz_tourism/modules/auth/data/models/telegram_otp_model.dart';
// import 'package:kyrgyz_tourism/modules/auth/domain/usecases/password_reset_confirm_use_case.dart';
// import 'package:kyrgyz_tourism/modules/auth/domain/usecases/refresh_token_use_case.dart';
// import 'package:kyrgyz_tourism/modules/auth/domain/usecases/register_otp_use_case.dart';
// import 'package:kyrgyz_tourism/modules/auth/domain/usecases/sign_in_use_case.dart';
// import 'package:kyrgyz_tourism/modules/auth/domain/usecases/sign_up_use_case.dart';
// import 'package:kyrgyz_tourism/modules/auth/domain/usecases/telegram_confirm_use_case.dart';
// import 'package:kyrgyz_tourism/modules/profile/data/models/profile_model.dart';
// import 'package:kyrgyz_tourism/modules/profile/domain/usecases/update_profile_use_case.dart';
// import 'package:retrofit/retrofit.dart';
// import 'package:injectable/injectable.dart';

// part 'auth_api_service.g.dart';

// @RestApi(baseUrl: ApiUrls.baseUrl)
// @injectable
// abstract class AuthApiService {
//   @factoryMethod
//   factory AuthApiService(Dio dio, {@Named("BaseUrl") String baseUrl}) =
//       _AuthApiService;

//   @POST('/v1/api/sign-up')
//   Future<SignUpModel> signup(@Body() SignUpParams params);

//   @GET('/v1/api/verify')
//   Future<void> verifyCode(@Query('code') String code);

//   @GET('/v1/api/exists/{nickname}')
//   Future<bool> checkNickname(@Path('nickname') String nickname);

//   @POST('/v1/api/sign-in')
//   Future<SignInModel> signIn(@Body() SignInParams params);

//   @POST('/v1/api/refresh')
//   Future<SignInModel> refreshToken(@Body() RefreshParams params);

//   @POST('/v1/api/otp/register')
//   Future<TelegramOtpModel> registerOtp(@Body() RegisterOtpParams params);

//   @POST('/v1/api/otp/confirm')
//   Future<TelegramConfirmModel> confirmOtp(@Body() ConfirmOtpParams params);

//   @GET('/v1/api/otp/link{link}')
//   Future<String> getOtpLink(@Path('link') String link);

//   @POST('/v1/api/password-reset/{email}')
//   Future<String> passwordReset(@Query('email') String email);

//   @POST('/v1/api/password-reset/confirm')
//   Future<String> passwordResetConfirm(
//     @Body() PasswordResetConfirmParams params,
//   );

//   @GET('/v1/api/profiles/me')
//   Future<ProfileModel> getProfile();

//   @PUT('/v1/api/profiles/me')
//   Future<ProfileModel> updateProfile(@Body() ProfileParams params);

//   @PUT('/v1/api/profiles/me/photo')
//   @MultiPart()
//   Future<ProfileModel> uploadProfilePhoto(@Part() File photo);
// }
