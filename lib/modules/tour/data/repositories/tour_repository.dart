import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/constants/api_urls.dart';
import 'package:kyrgyz_tourism/core/network/dio_client.dart';
import 'package:kyrgyz_tourism/modules/tour/data/models/tour_model.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/repositories/tour_domain_repository.dart';

@LazySingleton(as: TourDomainRepository)
class TourRepository extends TourDomainRepository {
  final DioClient _dio;

  TourRepository({required DioClient dio}) : _dio = dio;

  @override
  Future<List<TourModel>> getTours() async {
    try {
      final response = await _dio.get(ApiUrls.getTours);

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

        log('Tour response: ${response.data}');

        return result;
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
}
