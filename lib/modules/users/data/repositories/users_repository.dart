import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/network/dio_client.dart';
import 'package:kyrgyz_tourism/modules/users/data/models/model.dart';
import 'package:kyrgyz_tourism/modules/users/domain/repositories/users_domain_repository.dart';

@LazySingleton(as: UsersDomainRepository)
class UsersRepository extends UsersDomainRepository {
  final DioClient _dio;

  UsersRepository({required DioClient dio}) : _dio = dio;

  @override
  Future<List<UsersModel>> getUsers() async {
    try {
      final response = await _dio.get('https://randomuser.me/api/?results=10');
      final List<dynamic> results = response.data['results'];

      final users =
          results.map((user) {
            return UsersModel(
              email: user['email'],
              gender: user['gender'],
              picture: user['picture']['thumbnail'],
            );
          }).toList();

      log('Данные загружены: $users');
      return users;
    } catch (e) {
      log('Ошибка загрузки данных: $e');
      return [];
    }
  }
}
