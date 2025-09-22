import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/network/dio_client.dart';
import 'package:kyrgyz_tourism/core/network/storage_secure_storage/token_storage_service.dart';
import 'package:kyrgyz_tourism/features/auth/data/api_service/auth_api_service.dart';
import 'package:kyrgyz_tourism/features/profile/data/api_service/profile_api.dart';
import 'package:kyrgyz_tourism/features/profile/domain/entities/profile_entity.dart';
import 'package:kyrgyz_tourism/features/profile/domain/repositories/profile_domain_repository.dart';
import 'package:kyrgyz_tourism/features/profile/domain/usecases/update_profile_use_case.dart';

@LazySingleton(
  as: ProfileDomainRepository,
  // env: [Environment.dev],
)
class ProfileRepository extends ProfileDomainRepository {
  final ProfileApi _profileApi;

  ProfileRepository({
    required AuthApiService authApi,
    required TokenStorageService tokenStorage,
    required DioClient dio,
    required ProfileApi profileApi,
  }) : _profileApi = profileApi;

  @override
  Future<ProfileEntity> uploadProfilePhoto(File photo) async {
    final response = await _profileApi.uploadProfilePhoto(photo);
    return response;
  }

  @override
  Future<ProfileEntity> updateProfile(ProfileParams params) async {
    return _profileApi.updateProfile(params);
  }

  @override
  Future<ProfileEntity> getProfile() async {
    return await _profileApi.getProfile();
  }
}




  // @override
  // Future<ProfileModel> getProfile() async {
  //   final token = await _tokenStorage.getAccessToken();

  //   final response = await _dio.get(
  //     ApiUrls.getProfile,
  //     options: Options(
  //       headers: {
  //         'accept': '*/*',
  //         'Content-Type': 'application/json',
  //         "Authorization": "Bearer $token",
  //       },
  //     ),
  //   );
  //   if (response.statusCode == 200) {
  //     return ProfileModel.fromJson(response.data);
  //   } else {
  //     throw Exception("Ошибка загрузки профиля");
  //   }
  // }

  // @override
  // Future<ProfileModel> getProfile() async {
  //   final token = await _tokenStorage.getAccessToken();

  //   if (_isMockToken(token)) {
  //     return _getMockProfile();
  //   } else {
  //     return await _authApi.getProfile();
  //   }
  // }

  // bool _isMockToken(String? token) {
  //   return token != null && token.startsWith('mock_');
  // }

  // Future<ProfileModel> _getMockProfile() async {
  //   await Future.delayed(Duration(milliseconds: 500));

  //   return ProfileModel(
  //     fullName: '',
  //     birthDate: '',
  //     lastLogin: '',
  //     workStartDate: '',
  //     description: '',
  //     id: 1,
  //     name: '',
  //     nickname: '',
  //     email: '',
  //     image: '',
  //     phoneNumber: '',
  //     roles: [],
  //   );
  // }