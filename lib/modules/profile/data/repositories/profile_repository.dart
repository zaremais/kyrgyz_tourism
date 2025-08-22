import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/network/storage_secure_storage/token_storage_service.dart';
import 'package:kyrgyz_tourism/modules/auth/data/api_service/auth_api_service.dart';
import 'package:kyrgyz_tourism/modules/profile/data/models/profile_model.dart';
import 'package:kyrgyz_tourism/modules/profile/domain/entities/profile_entity.dart';
import 'package:kyrgyz_tourism/modules/profile/domain/repositories/profile_domain_repository.dart';
import 'package:kyrgyz_tourism/modules/profile/domain/usecases/update_profile_use_case.dart';

@LazySingleton(as: ProfileDomainRepository, env: [Environment.dev])
class ProfileRepository extends ProfileDomainRepository {
  final TokenStorageService _tokenStorage;
  final AuthApiService _authApi;

  ProfileRepository({
    required AuthApiService authApi,
    required TokenStorageService tokenStorage,
  }) : _authApi = authApi,
       _tokenStorage = tokenStorage;

  @override
  Future<ProfileModel> getProfile() async {
    final token = await _tokenStorage.getAccessToken();

    if (_isMockToken(token)) {
      return _getMockProfile();
    } else {
      return await _authApi.getProfile();
    }
  }

  bool _isMockToken(String? token) {
    return token != null && token.startsWith('mock_');
  }

  Future<ProfileModel> _getMockProfile() async {
    await Future.delayed(Duration(milliseconds: 500));

    return ProfileModel(
      fullName: '',
      birthDate: '',
      lastLogin: '',
      workStartDate: '',
      description: '',
      id: 1,
      name: '',
      nickname: '',
      email: '',
      image: '',
      phoneNumber: '',
      roles: [],
    );
  }

  @override
  Future<ProfileModel> updateProfile(ProfileParams params) async {
    final response = await _authApi.updateProfile(params);

    return response;
  }

  @override
  Future<ProfileEntity> uploadProfilePhoto(File photo) async {
    final response = await _authApi.uploadProfilePhoto(photo);
    return response;
  }
}
