import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/network/storage_secure_storage/token_storage_service.dart';
import 'package:kyrgyz_tourism/modules/auth/data/models/sign_in_model.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_sign_in_repository.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/refresh_token_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/sign_in_use_case.dart';

@LazySingleton(as: AuthDomainSignInRepository, env: [Environment.dev])
class MockAuthSignInRepository extends AuthDomainSignInRepository {
  final TokenStorageService _tokenStorage;

  MockAuthSignInRepository({required TokenStorageService tokenStorage})
    : _tokenStorage = tokenStorage;

  @override
  Future<SignInModel> signIn({required SignInParams params}) async {
    await Future.delayed(Duration(seconds: 1));

    final mockResponse = SignInModel(
      accessToken: 'mock_access_token_${DateTime.now().millisecondsSinceEpoch}',
      refreshToken:
          'mock_refresh_token_${DateTime.now().millisecondsSinceEpoch}',
    );

    await _tokenStorage.saveTokens(
      accessToken: mockResponse.accessToken,
      refreshToken: mockResponse.refreshToken,
    );

    return mockResponse;
  }

  @override
  Future<SignInModel> refreshToken(RefreshParams params) async {
    await Future.delayed(Duration(seconds: 1));

    final mockResponse = SignInModel(
      accessToken:
          'refreshed_access_token_${DateTime.now().millisecondsSinceEpoch}',
      refreshToken:
          'refreshed_refresh_token_${DateTime.now().millisecondsSinceEpoch}',
    );

    await _tokenStorage.saveTokens(
      accessToken: mockResponse.accessToken,
      refreshToken: mockResponse.refreshToken,
    );

    return mockResponse;
  }
}


// @LazySingleton(as: ProfileDomainRepository)
// class ProfileRepository extends ProfileDomainRepository {
//   final AuthApiService _authApi;

//   ProfileRepository({required AuthApiService authApi}) : _authApi = authApi;

//   @override
//   Future<ProfileModel> getProfile() async {
//     // Всегда используем реальный API
//     return await _authApi.getProfile();
//   }

//   @override
//   Future<ProfileEntity> updateProfile(ProfileParams params) {
//     // TODO: implement updateProfile
//     throw UnimplementedError();
//   }

//   @override
//   Future<ProfileEntity> uploadProfilePhoto(File photo) {
//     // TODO: implement uploadProfilePhoto
//     throw UnimplementedError();
//   }
// }