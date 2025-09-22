import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:kyrgyz_tourism/features/profile/data/models/profile_model.dart';
import 'package:kyrgyz_tourism/features/profile/domain/usecases/update_profile_use_case.dart';
import 'package:retrofit/error_logger.dart';

import 'package:retrofit/http.dart';

part 'profile_api.g.dart';

@RestApi(baseUrl: 'http://34.18.76.114')
@injectable
abstract class ProfileApi {
  @factoryMethod
  factory ProfileApi(Dio dio, {@Named("BaseUrl") String baseUrl}) = _ProfileApi;

  @GET('/v1/api/profiles/me')
  Future<ProfileModel> getProfile();

  @PUT('/v1/api/profiles/me')
  Future<ProfileModel> updateProfile(@Body() ProfileParams params);

  @PUT('/v1/api/profiles/me/photo')
  @MultiPart()
  Future<ProfileModel> uploadProfilePhoto(@Part() File photo);
}
