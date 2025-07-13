import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/constants/api_urls.dart';
import 'package:kyrgyz_tourism/core/exception/auth_exception.dart';
import 'package:kyrgyz_tourism/core/network/dio_client.dart';
import 'package:kyrgyz_tourism/core/network/storage_secure_storage/storage_secure_service.dart';
import 'package:kyrgyz_tourism/modules/auth/data/models/sign_in_model.dart';
import 'package:kyrgyz_tourism/modules/auth/data/models/sign_up_model.dart';
import 'package:kyrgyz_tourism/modules/auth/data/models/telegram_model.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/reset_password_result.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/telegram_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_repository.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/confirm_otp_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/reset_password_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/send_otp_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/sign_in_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/sign_up_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: AuthDomainRepository)
class AuthRepository extends AuthDomainRepository {
  final DioClient _dio;
  final SecureStorage _storage;
  AuthRepository({required DioClient dio, required SecureStorage storage})
    : _dio = dio,
      _storage = storage;

  @override
  Future<SignInModel> signin(SignInParams params) async {
    try {
      final result = await _dio.post(
        ApiUrls.signin,

        data: params.toJson(),

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
        final result = SignInModel.fromJson(data);

        final prefs = await SharedPreferences.getInstance();

        await prefs.setString('token', result.accessToken ?? '');
        await prefs.setString('refreshToken', result.refreshToken ?? '');

        log(' New Access Token: ${result.accessToken}');
        log(' New Refresh Token: ${result.refreshToken}');

        log('Saved Access Token: ${prefs.getString('token')}');
        log('Saved Refresh Token: ${prefs.getString('refreshToken')}');

        return result;
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
  Future<ResetPasswordResult> resetPassword(ResetPasswordParams params) async {
    try {
      final result = await _dio.post(
        ApiUrls.resetPassword,
        data: params.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      final data =
          result.data is String ? jsonDecode(result.data) : result.data;
      if (result.statusCode == 200) {
        return ResetPasswordResult(
          message: data['message'] ?? 'Проверьте вашу почту',
        );
      } else {
        throw Exception('Ошибка восстановления: ${data.toString()}');
      }
    } catch (e) {
      throw Exception('Ошибка при восстановлении: ${e.toString()}');
    }
  }

  @override
  Future<TelegramModel> confirmOtp({required ConfirmOtpParams params}) async {
    try {
      final result = await _dio.post(
        ApiUrls.confirmOtp,
        data: params.toJson(),
        options: Options(
          headers: {'accept': '*/*', 'Content-Type': 'application/json'},
          validateStatus: (_) => true,
        ),
      );
      return result.data['accessToken'];
      log('Confirm OTP response: ${result.data}');

      if (result.data == null || result.data.toString().isEmpty) {
        throw FormatException('Пустой ответ от сервера');
      }

      final data =
          result.data is String ? jsonDecode(result.data) : result.data;
      return TelegramModel.fromJson(data, url: '');
    } on DioException catch (e) {
      throw _handleDioError(e);
    } on FormatException catch (e) {
      log('[ConfirmOtp] Format error: $e');
      rethrow;
    }
  }

  @override
  Future<TelegramModel> sendOtp(SendOtpParams params) async {
    try {
      final result = await _dio.post(
        ApiUrls.sendOtp,
        data: params.toJson(),
        options: Options(
          headers: {'accept': '*/*', 'Content-Type': 'application/json'},
          validateStatus: (_) => true,
        ),
      );

      if (result.statusCode != 200) {
        final errorFile = File('error_response.txt');
        await errorFile.writeAsString(
          'Status: ${result.statusCode}\n'
          'Headers: ${result.headers}\n'
          'Data: ${result.data}',
        );
        log('Full error saved to: ${errorFile.path}');
      }
      if (result.statusCode == 200 && result.data != null) {
        return TelegramModel.fromJson(result.data, url: '');
      } else {
        throw Exception(
          'Ошибка регистрации: ${result.statusCode} ${result.data}',
        );
      }
    } catch (e) {
      throw Exception('Ошибка регистрации: ${e.toString()}');
    }
  }

  Never _handleDioError(DioException e) {
    final statusCode = e.response?.statusCode;
    final path = e.requestOptions.path;

    if (e.response == null) {
      // print('Dio error type: ${e.type}');
      // print('Request URL: ${e.requestOptions.uri}');
      // print('Error message: ${e.message}');
      // print('DioException toString(): ${e.toString()}');
      // print('DioException.response: ${e.response}');
      throw AuthException.network(
        'Нет ответа от сервера. Проверьте подключение к интернету.',
      );
    }
    if (statusCode == 403) {
      throw AuthException('OTP недействителен или устарел', code: 403);
    }

    if (statusCode == 400 || statusCode == 401) {
      throw AuthException(
        'Неверные данные для подтверждения',
        code: statusCode,
      );
    }

    final fallbackMessage = e.message ?? 'Произошла сетевая ошибка';
    final fullMessage = '[$statusCode] $path → $fallbackMessage';

    throw AuthException.network(fullMessage);
  }

  @override
  Future<TelegramModel> getOtpLink() async {
    try {
      final result = await _dio.get(ApiUrls.getOtpLink);
      return TelegramModel.fromJson(result.data['url'], url: 'url');
    } catch (e) {
      throw (e.toString());
    }
  }
}
