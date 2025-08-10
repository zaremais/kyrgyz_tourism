import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/constants/api_urls.dart';
import 'package:kyrgyz_tourism/core/error/handler_dio_error.dart';
import 'package:kyrgyz_tourism/core/network/dio_client.dart';
import 'package:kyrgyz_tourism/core/network/storage_secure_storage/token_storage_service.dart';
import 'package:kyrgyz_tourism/modules/auth/data/models/sign_up_model.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_sign_up_repository.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/check_nickname_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/sign_up_use_case.dart';

@LazySingleton(as: AuthDomainSignUpRepository)
class AuthSignUpRepository extends AuthDomainSignUpRepository {
  final DioClient _dio;
  final TokenStorageService _tokenStorage;

  AuthSignUpRepository({
    required DioClient dio,
    required TokenStorageService tokenStorage,
  }) : _dio = dio,
       _tokenStorage = tokenStorage;

  @override
  Future<bool> checkNickname(NickNameParams params) async {
    try {
      final response = await _dio.get(ApiUrls.checkNickname(params.nickname));
      return response.data == true;
    } catch (e) {
      throw Exception('Ошибка проверки никнейма: $e');
    }
  }

  @override
  Future<bool> verifyCode(String code) async {
    try {
      final result = await _dio.get(
        ApiUrls.verifyCode,
        options: Options(
          headers: {'Content-Type': 'application/json', 'accept': '*/*'},
        ),
        queryParameters: {"code": code},
      );

      log('Verify response: ${result.data}');

      if (result.statusCode == 200) {
        if (result.data['accessToken'] != null &&
            result.data['refreshToken'] != null) {
          await _tokenStorage.saveTokens(
            accessToken: result.data['accessToken'],
            refreshToken: result.data['refreshToken'],
          );
        }

        return result.data;
      } else {
        throw Exception('Ошибка подтверждения: ${result.data}');
      }
    } on DioException catch (e) {
      ErrorHandler.handleDioError(e);
      rethrow;
    } catch (e) {
      throw Exception('Ошибка регистрации: $e');
    }
  }

  @override
  Future<SignUpModel> signup(SignUpParams params) async {
    try {
      final response = await _dio.post(
        ApiUrls.signup,
        data: params.toJson(),
        options: Options(
          headers: {'Content-Type': 'application/json', 'accept': '*/*'},
          validateStatus: (status) => status! < 500,
        ),
      );

      if (response.data['accessToken'] != null) {
        await _tokenStorage.saveTokens(
          accessToken: response.data['accessToken'],
          refreshToken: response.data['refreshToken'],
        );
      }

      return SignUpModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Ошибка регистрации: ${e.response?.data}');
    } catch (e) {
      throw Exception('Ошибка регистрации: ${e.toString()}');
    }
  }

  Future<void> clearStoredTokens() async {
    await _tokenStorage.clearTokens();
  }

  Future<bool> isLoggedIn() async {
    final accessToken = await _tokenStorage.getAccessToken();
    return accessToken != null && accessToken.isNotEmpty;
  }
}
