import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/network/dio_client.dart';
import 'package:kyrgyz_tourism/core/network/storage_secure_storage/token_storage_service.dart';
import 'package:kyrgyz_tourism/modules/auth/data/api_service/auth_api_service.dart';
import 'package:kyrgyz_tourism/modules/profile/domain/entities/profile_entity.dart';
import 'package:kyrgyz_tourism/modules/profile/domain/repositories/profile_domain_repository.dart';
import 'package:kyrgyz_tourism/modules/profile/domain/usecases/update_profile_use_case.dart';

@LazySingleton(
  as: ProfileDomainRepository,
  // env: [Environment.dev],
)
class ProfileRepository extends ProfileDomainRepository {
  // final TokenStorageService _tokenStorage = TokenStorageService();
  // final DioClient _dio;
  final AuthApiService _authApi;

  ProfileRepository({
    required AuthApiService authApi,
    required TokenStorageService tokenStorage,
    required DioClient dio,
  }) : _authApi = authApi;

  //  _dio = dio;

  @override
  Future<ProfileEntity> uploadProfilePhoto(File photo) async {
    final response = await _authApi.uploadProfilePhoto(photo);
    return response;
  }

  @override
  Future<ProfileEntity> updateProfile(ProfileParams params) async {
    return _authApi.updateProfile(params);
  }

  @override
  Future<ProfileEntity> getProfile() async {
    return await _authApi.getProfile();
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