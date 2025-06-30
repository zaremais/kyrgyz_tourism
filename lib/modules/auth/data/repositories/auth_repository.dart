import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/constants/api_urls.dart';
import 'package:kyrgyz_tourism/core/network/dio_client.dart';
import 'package:kyrgyz_tourism/modules/auth/data/models/sign_in_model.dart';
import 'package:kyrgyz_tourism/modules/auth/data/models/sign_up_model.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_repository.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/send_phone_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/sign_in_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/signup_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/verify_otp_use_case.dart';
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
        // "http://34.18.76.114/v1/api/sign-in",
        data: {"identifier": "admin", "password": "admin"},
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
        await prefs.setString('token', response.accessToken as String);

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
  Future<void> sendPhoneNumber(SendOtpParams params) async {
    try {
      final result = await _dio.post(
        "http://34.18.76.114/v1/api/otp/link",
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
  Future<void> verifyOtp(VerifyOtpParams params) async {
    try {
      final result = await _dio.post(
        "http://34.18.76.114/v1/api/otp/verify",
        data: params.toJson(),
        options: Options(
          headers: {'accept': '*/*', 'Content-Type': 'application/json'},
          validateStatus: (_) => true,
        ),
      );

      log('Verify OTP status: ${result.statusCode}');
      log('Verify OTP response: ${result.data}');

      if (result.statusCode == 200) {
        final data =
            result.data is String ? jsonDecode(result.data) : result.data;

        final accessToken = data['accessToken'];
        if (accessToken != null) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', accessToken);
        }

        return;
      } else {
        final data =
            result.data is String ? jsonDecode(result.data) : result.data;
        throw Exception('Ошибка подтверждения OTP: ${data.toString()}');
      }
    } catch (e) {
      throw Exception('Ошибка: ${e.toString()}');
    }
  }
}
