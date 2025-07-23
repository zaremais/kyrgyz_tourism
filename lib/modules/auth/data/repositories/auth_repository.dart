import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/constants/api_urls.dart';
import 'package:kyrgyz_tourism/core/network/dio_client.dart';
import 'package:kyrgyz_tourism/core/network/storage_secure_storage/token_storage_service.dart';
import 'package:kyrgyz_tourism/modules/auth/data/models/sign_in_model.dart';
import 'package:kyrgyz_tourism/modules/auth/data/models/sign_up_model.dart';
import 'package:kyrgyz_tourism/modules/auth/data/models/telegram_model.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/reset_password_result.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_repository.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/confirm_otp_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/reset_password_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/send_otp_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/sign_in_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/sign_up_use_case.dart';

@LazySingleton(as: AuthDomainRepository)
class AuthRepository extends AuthDomainRepository {
  final DioClient _dio;
  final TokenStorageService _tokenStorage = TokenStorageService();

  AuthRepository({required DioClient dio}) : _dio = dio;

  @override
  Future<SignInModel> login(SignInParams params) async {
    final response = await _dio.post('/v1/api/sign-in', data: params.toJson());

    final storage = TokenStorageService();
    log('ACCESS TOKEN: ${await storage.getAccessToken()}');
    log('REFRESH TOKEN: ${await storage.getRefreshToken()}');

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
  Future<SignUpModel> signup(SignUpParams params) async {
    final result = await _dio.post(
      ApiUrls.signup,
      data: params.toJson(),
      options: _jsonOptions,
    );

    if (result.statusCode == 200) {
      await _tokenStorage.saveTokens(
        accessToken: result.data['accessToken'],
        refreshToken: result.data['refreshToken'],
      );

      return SignUpModel.fromJson(_parseResponseData(result.data));
    } else {
      throw Exception('Ошибка регистрации');
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    final token = await _tokenStorage.getAccessToken();
    return token != null && token.isNotEmpty;
  }

  @override
  Future<String> getTelegramBotLink() async {
    final result = await _dio.get(ApiUrls.getOtpLink);
    return result.data['link'];
  }

  @override
  Future<TelegramModel> sendOtp(SendOtpParams params) async {
    final result = await _dio.post(
      ApiUrls.sendOtp,
      data: params.toJson(),
      options: _jsonOptions,
    );

    return TelegramModel.fromJson(_parseResponseData(result.data));
  }

  @override
  Future<TelegramModel> confirmOtp(ConfirmOtpParams params) async {
    final result = await _dio.post(
      ApiUrls.confirmOtp,
      data: params.toJson(),
      options: _jsonOptions,
    );

    return TelegramModel.fromJson(_parseResponseData(result.data));
  }

  @override
  Future<ResetPasswordResult> resetPassword(ResetPasswordParams params) {
    // пока не реализовано
    throw UnimplementedError();
  }

  final _jsonOptions = Options(
    headers: {'accept': '*/*', 'Content-Type': 'application/json'},
    validateStatus: (_) => true,
  );

  dynamic _parseResponseData(dynamic data) =>
      data is String ? jsonDecode(data) : data;
}
