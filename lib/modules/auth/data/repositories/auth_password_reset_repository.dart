import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/constants/api_urls.dart';
import 'package:kyrgyz_tourism/core/network/dio_client.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_password_reset_repository.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/password_reset_confirm_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/password_reset_use_case.dart';

@LazySingleton(as: AuthDomainPasswordResetdRepository)
class AuthPasswordResetRepository extends AuthDomainPasswordResetdRepository {
  final DioClient _dio;

  AuthPasswordResetRepository({required DioClient dio}) : _dio = dio;
  @override
  Future<void> passwordReset(PasswordResetParams params) async {
    try {
      final result = await _dio.post(
        '${ApiUrls.passwordReset}?email=${params.email}',
        options: Options(
          headers: {'accept': '*/*', 'Content-Type': 'application/json'},
        ),
      );

      if (result.statusCode != 202) {
        throw Exception('Не удалось отправить письмо');
      }
    } catch (e) {
      if (e is DioException) {
        log("Dio Error: ${e.response?.data}");
      }
      throw Exception('Ошибка при сбросе пароля: $e');
    }
  }

  @override
  Future<void> passwordResetConfirm(PasswordResetConfirmParams params) async {
    try {
      final result = await _dio.post(
        ApiUrls.passwordConfirm,
        data: params.toJson(),
        options: Options(
          headers: {'accept': '*/*', 'Content-Type': 'application/json'},
        ),
      );

      if (result.statusCode != 200 && result.statusCode != 204) {
        throw Exception('Не удалось сбросить пароль');
      }
    } catch (e) {
      if (e is DioException) {
        log('Ошибка от сервера: ${e.response?.data}');
      }
      throw Exception('Ошибка при подтверждения сброса пароля: $e');
    }
  }
}
