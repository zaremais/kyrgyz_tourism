import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/constants/api_urls.dart';
import 'package:kyrgyz_tourism/core/network/dio_client.dart';
import 'package:kyrgyz_tourism/modules/profile/data/models/profile_model.dart';
import 'package:kyrgyz_tourism/modules/profile/domain/repositories/profile_domain_repository.dart';
import 'package:kyrgyz_tourism/modules/profile/domain/usecases/update_profile_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: ProfileDomainRepository)
class ProfileRepository extends ProfileDomainRepository {
  // final TokenStorageService _tokenStorage = TokenStorageService();
  final DioClient _dio;

  ProfileRepository({required DioClient dio}) : _dio = dio;

  @override
  Future<ProfileModel> getProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    final result = await _dio.get(
      ApiUrls.getProfile,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    // log('ACCESS TOKEN: ${await _tokenStorage.getAccessToken()}');
    // log('REFRESH TOKEN: ${await _tokenStorage.getRefreshToken()}');
    return ProfileModel.fromJson(result.data);
  }

  @override
  Future<void> updateProfile(ProfileParams params) async {
    final result = await _dio.put(ApiUrls.getProfile);

    return result.data;
  }
}
