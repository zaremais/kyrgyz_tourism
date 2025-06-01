import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/constants/api_urls.dart';
import 'package:kyrgyz_tourism/core/network/dio_client.dart';
import 'package:kyrgyz_tourism/modules/auth/data/models/token_model.dart';
import 'package:kyrgyz_tourism/modules/auth/data/models/user_model.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/token_einity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_repository.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/login_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/register_use_case.dart';

@LazySingleton(as: AuthDomainRepository)
class AuthRepository extends AuthDomainRepository {
  final DioClient _dio;

  AuthRepository({required DioClient dio}) : _dio = dio;

  @override
  Future<UserModel> login(LoginParams params) async {
    //   try {
    //     final result = await _dio.post(ApiUrls.login, data: params.toJson());
    //     return UserModel.fromJson(result.data);
    //   } catch (e) {
    //     throw Exception(('Ошибка при авторизации: ${e.toString()}'));
    //   }
    // }
    try {
      final jsonString = await rootBundle.loadString(
        'assets/api/auth_api.json',
      );
      final jsonData = json.decode(jsonString);
      print(jsonString.toString());
      return UserModel.fromJson(jsonData);
    } catch (e) {
      throw Exception('Ошибка при загрузке фейковых данных: $e');
    }
  }

  @override
  Future<UserModel> register(RegisterParams params) async {
    try {
      final result = await _dio.post(ApiUrls.register, data: params.toJson());
      return UserModel.fromJson(result.data);
    } catch (e) {
      throw Exception(('Ошибка регистрации: ${e.toString()}'));
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _dio.post(ApiUrls.logout);
    } catch (e) {
      throw Exception('Ошибка при выходе: ${e.toString()}');
    }
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      final result = await _dio.get(ApiUrls.currentUser);
      return UserModel.fromJson(result.data);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<TokenEntity> getToken() async {
    final result = await _dio.post(ApiUrls.token);
    return TokenModel.fromJson(result.data);
  }
}
