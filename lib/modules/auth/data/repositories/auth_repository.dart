import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/constants/api_urls.dart';
import 'package:kyrgyz_tourism/core/network/dio_client.dart';
import 'package:kyrgyz_tourism/modules/auth/data/models/sign_in_model.dart';
import 'package:kyrgyz_tourism/modules/auth/data/models/sign_up_model.dart';
import 'package:kyrgyz_tourism/modules/auth/data/models/telegram_model.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_repository.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/send_phone_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/sign_in_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/signup_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/otp_confirm_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: AuthDomainRepository)
class AuthRepository extends AuthDomainRepository {
  final DioClient _dio;

  AuthRepository({required DioClient dio}) : _dio = dio;

  @override
  Future<SignInModel> signin(SignInParams params) async {
    try {
      final result = await _dio.post(
        ApiUrls.signin,

        data: params.toJson(),
        // {"identifier": "admin", "password": "admin"},
        options: Options(
          headers: {'accept': '*/*', 'Content-Type': 'application/json'},
          validateStatus: (_) => true,
        ),
      );
      log('Login status: ${result.statusCode}');
      log('Login response: ${result.data}');

      final data =
          result.data is String ? jsonDecode(result.data) : result.data;

      if (result.statusCode == 200) {
        final response = SignInModel.fromJson(data);

        final prefs = await SharedPreferences.getInstance();

        await prefs.setString('token', response.accessToken ?? '');
        await prefs.setString('refreshToken', response.refreshToken ?? '');

        log(' New Access Token: ${response.accessToken}');
        log(' New Refresh Token: ${response.refreshToken}');

        log('Saved Access Token: ${prefs.getString('token')}');
        log('Saved Refresh Token: ${prefs.getString('refreshToken')}');

        return response;
      } else {
        throw Exception('Ошибка входа: ${data.toString()}');
      }
    } catch (e) {
      throw Exception('Ошибка авторизации: ${e.toString()}');
    }
  }

  @override
  Future<SignUpModel> signup(SignUpParams params) async {
    try {
      final result = await _dio.post(
        ApiUrls.signup,

        data: params.toJson(),
        options: Options(
          headers: {'accept': '*/*', 'Content-Type': 'application/json'},
          validateStatus: (_) => true,
        ),
      );

      log('Status code: ${result.statusCode}');
      log('Response: ${result.data}');

      final data =
          result.data is String ? jsonDecode(result.data) : result.data;

      if (result.statusCode == 200) {
        return SignUpModel.fromJson(data);
      } else {
        throw Exception('Ошибка регистрации: ${data.toString()}');
      }
    } catch (e) {
      throw Exception('Ошибка: ${e.toString()}');
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') != null;
  }

  @override
  Future<void> sendOtp(SendOtpParams params) async {
    try {
      final result = await _dio.post(
        ApiUrls.sendPhone,
        data: params.toJson(),
        options: Options(
          headers: {'accept': '*/*', 'Content-Type': 'application/json'},
          validateStatus: (_) => true,
        ),
      );

      log('Telegram status: ${result.statusCode}');
      log('Telegram response: ${result.data}');

      if (result.statusCode == 200) {
        return;
      } else {
        final data =
            result.data is String ? jsonDecode(result.data) : result.data;
        throw Exception('Ошибка отправки OTP: ${data.toString()}');
      }
    } catch (e) {
      throw Exception('Ошибка при запросе: ${e.toString()}');
    }
  }

  @override
  Future<TelegramModel> verifyOtp(OtpConfirmParams params) async {
    try {
      final response = await _dio.post(
        ApiUrls.verifyOtp,
        data: params.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200) {
        log('Verify OTP success: ${response.data}');
        return TelegramModel.fromJson(response.data);
      } else {
        log('Verify OTP error: ${response.statusCode} - ${response.data}');
        throw Exception(
          'Ошибка подтверждения OTP: ${response.data?['message'] ?? response.statusCode}',
        );
      }
    } catch (e) {
      log('Network error: $e');
      throw Exception('Ошибка сети: ${e.toString()}');
    }
  }

  Future<void> OtpGet({
    required String phoneNumber,
    required String otpCode,
  }) async {
    await _dio.get(
      ApiUrls.verifyOtp,
      queryParameters: {'phoneNumber': phoneNumber, 'code': otpCode},
    );
  }
}
