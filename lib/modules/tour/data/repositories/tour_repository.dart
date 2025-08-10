import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/constants/api_urls.dart';
import 'package:kyrgyz_tourism/core/network/dio_client.dart';
import 'package:kyrgyz_tourism/modules/tour/data/models/tour_model.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/repositories/tour_domain_repository.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/usecases/filter_tours_use_case.dart';

@LazySingleton(as: TourDomainRepository)
class TourRepository extends TourDomainRepository {
  final DioClient _dio;

  TourRepository({required DioClient dio}) : _dio = dio;

  @override
  Future<List<TourModel>> getTours(
    int page,
    int size, {
    required String sort,
  }) async {
    try {
      final response = await _dio.get(
        ApiUrls.getTours,
        queryParameters: {'page': page, 'size': size, 'sort': sort},
      );

      if (response.statusCode == 200) {
        final data = response.data as List<dynamic>;
        return data.map((e) => TourModel.fromJson(e)).toList();
      } else {
        throw Exception('Ошибка загрузки туров: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Ошибка при получении туров: $e');
    }
  }

  @override
  Future<List<TourModel>> getIndividualTour() async {
    try {
      final response = await _dio.get(ApiUrls.getIndividualTours);

      if (response.statusCode == 200) {
        final toursData = response.data as List<dynamic>;
        final result = <TourModel>[];
        for (final item in toursData) {
          try {
            result.add(TourModel.fromJson(item));
          } catch (e) {
            log('Ошибка парсинга тура: $e');
            log('Неверный объект: $item');
          }
        }

        log('IndividualTour response: ${response.data}');

        return result;
      } else {
        throw Exception('Ошибка загрузки туров: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Ошибка при получении туров: $e');
    }
  }

  @override
  Future<List<TourModel>> filterTours(FilterTourParams params) async {
    try {
      final response = await _dio.post(
        ApiUrls.filterTours,
        data: params.toJson(),
        options: Options(
          headers: {'accept': '*/*', 'Content-Type': 'application/json'},
        ),
      );

      return (response.data as List)
          .map((e) => TourModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Некорректные параметры фильтрации: $e');
    }
  }
}
