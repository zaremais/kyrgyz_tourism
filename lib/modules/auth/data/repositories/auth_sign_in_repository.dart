import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/constants/api_urls.dart';
import 'package:kyrgyz_tourism/core/network/dio_client.dart';
import 'package:kyrgyz_tourism/core/network/storage_secure_storage/token_storage_service.dart';
import 'package:kyrgyz_tourism/modules/auth/data/models/sign_in_model.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/sign_in_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_sign_in_repository.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/refresh_token_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/sign_in_use_case.dart';

@LazySingleton(as: AuthDomainSignInRepository)
class AuthSignInRepository extends AuthDomainSignInRepository {
  final DioClient _dio;

  final TokenStorageService _tokenStorage = TokenStorageService();

  AuthSignInRepository({required DioClient dio}) : _dio = dio;

  @override
  Future<SignInModel> signIn(SignInParams params) async {
    final response = await _dio.post(
      ApiUrls.signin,
      data: params.toJson(),
      options: Options(
        headers: {'Content-Type': 'application/json', 'accept': '*/*'},
      ),
    );

    if (response.statusCode == 200) {
      await _tokenStorage.saveTokens(
        accessToken: response.data['accessToken'],
        refreshToken: response.data['refreshToken'],
      );

      return SignInModel.fromJson(response.data);
    } else {
      throw Exception('Ошибка авторизации');
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    final accessToken = await _tokenStorage.getAccessToken();
    return accessToken != null && accessToken.isNotEmpty;
  }

  @override
  Future<SignInEntity> refreshToken(RefreshParams params) async {
    final response = await _dio.post(
      ApiUrls.refreshToken,
      data: params.toJson(),
    );

    if (response.statusCode == 200) {
      await _tokenStorage.saveTokens(
        accessToken: response.data['accessToken'],
        refreshToken: response.data['refreshToken'],
      );

      return SignInModel.fromJson(response.data);
    } else {
      throw Exception('Ошибка авторизации');
    }
  }
}
