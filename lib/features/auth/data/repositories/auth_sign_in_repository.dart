import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/network/storage_secure_storage/token_storage_service.dart';
import 'package:kyrgyz_tourism/features/auth/data/api_service/auth_api_service.dart';
import 'package:kyrgyz_tourism/features/auth/data/models/sign_in_model.dart';
import 'package:kyrgyz_tourism/features/auth/domain/repositories/auth_domain_sign_in_repository.dart';
import 'package:kyrgyz_tourism/features/auth/domain/usecases/refresh_token_use_case.dart';
import 'package:kyrgyz_tourism/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: AuthDomainSignInRepository)
class AuthSignInRepository extends AuthDomainSignInRepository {
  final AuthApiService _authApi;
  final TokenStorageService _tokenStorage;

  AuthSignInRepository({
    required AuthApiService api,
    required TokenStorageService tokenStorage,
  }) : _authApi = api,
       _tokenStorage = tokenStorage;

  @override
  Future<SignInModel> signIn(SignInParams params) async {
    try {
      final response = await _authApi.signIn(params);

      await _tokenStorage.saveTokens(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
      );

      return response;
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        throw Exception('Неверный логин или пароль');
      }
      rethrow;
    }
  }

  @override
  Future<SignInModel> refreshToken(RefreshParams params) async {
    log('SignIn params: $params');
    final response = await _authApi.refreshToken(params);

    log('SignIn response: $response');
    log('Access token: ${response.accessToken}');
    log('Refresh token: ${response.refreshToken}');

    await _tokenStorage.saveTokens(
      accessToken: response.accessToken,
      refreshToken: response.refreshToken,
    );

    return response;
  }

  @override
  Future<bool> getRememberMe() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool('remember_me') ?? false;
  }
}

Future<void> setRememberMe(bool value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('remember_me', value);
}

class ServerConfigurationException implements Exception {
  final String message;
  ServerConfigurationException(this.message);

  @override
  String toString() => message;
}
