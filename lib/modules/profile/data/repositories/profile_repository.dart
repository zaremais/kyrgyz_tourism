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
    // final accessToken = await _tokenStorage.getAccessToken();
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    final response = await _dio.get(
      ApiUrls.getProfile,
      options: Options(
        headers: {
          'accept': '*/*',
          'Content-Type': 'application/json',
          "Authorization": "Bearer $token",
        },
      ),
    );
    if (response.statusCode == 200) {
      return ProfileModel.fromJson(response.data);
    } else {
      throw Exception("Ошибка загрузки профиля");
    }
  }

  @override
  Future<void> updateProfile(ProfileParams params) async {
    final result = await _dio.put(ApiUrls.getProfile);

    return result.data;
  }
}
