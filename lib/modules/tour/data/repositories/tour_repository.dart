import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/network/dio_client.dart';
import 'package:kyrgyz_tourism/modules/tour/data/models/tour_model.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/repositories/tour_domain_repository.dart';

@LazySingleton(as: TourDomainRepository)
class TourDataRepository extends TourDomainRepository {
  final DioClient _dio;

  TourDataRepository({required DioClient dio}) : _dio = dio;

  @override
  Future<List<TourModel>> getTours() async {
    try {
      final response = await _dio.get('http://34.18.76.114/v1/api/tours');

      if (response.statusCode == 200) {
        final toursData = response.data as List<dynamic>;
        final result = toursData.map((e) => TourModel.fromJson(e)).toList();
        return result;
      } else {
        throw Exception('Ошибка загрузки туров: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Ошибка при получении туров: $e');
    }
  }
}

// import 'dart:convert';
// import 'package:flutter/services.dart';
// import 'package:kyrgyz_tourism/core/constants/api_urls.dart';

// @LazySingleton(as: TourDomainRepository)
// class TourDataRepository extends TourDomainRepository {
//   TourDataRepository(DioClient dio);

//   @override
//   Future<List<TourModel>> getTours() async {
//     final List<dynamic> data = await readJson();
//     return data.map((e) => TourModel.fromJson(e)).toList();

//     final guideName = data[0].guide.name;
//     log("Гид: $guideName");
//   }

//   Future<List<dynamic>> readJson() async {
//     final String response = await rootBundle.loadString(ApiUrls.baseURL);
//     log(response.toString());

//     return await json.decode(response);
//   }
// }
