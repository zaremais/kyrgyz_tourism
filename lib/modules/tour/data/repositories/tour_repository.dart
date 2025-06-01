import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/network/dio_client.dart';
import 'package:kyrgyz_tourism/modules/tour/data/models/tour_model.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/repositories/tour_domain_repository.dart';

// @LazySingleton(as: TourDomainRepository)
// class TourDataRepository extends TourDomainRepository {
//   final DioClient _dio;

//   TourDataRepository({required DioClient dio}) : _dio = dio;

//   @override
//   Future<List<TourModel>> getTours() async {
//     try {
//       final response = await _dio.get(
//         'https://d021-158-181-132-208.ngrok-free.app/v1/api/tours',
//       );

//       if (response.statusCode == 200) {
//         final toursData = response.data['tours'] as List<dynamic>;
//         final result = toursData.map((e) => TourModel.fromJson(e)).toList();
//         return result;
//       } else {
//         throw Exception('Ошибка загрузки туров: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Ошибка при получении туров: $e');
//     }
//   }
// }

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:kyrgyz_tourism/core/constants/api_urls.dart';

@LazySingleton(as: TourDomainRepository)
class TourDataRepository extends TourDomainRepository {
  TourDataRepository(DioClient dio);

  @override
  Future<List<TourModel>> getTours() async {
    final List<dynamic> data = await readJson();
    return data.map((e) => TourModel.fromJson(e)).toList();

    final guideName = data[0].guide.name;
    print("Гид: $guideName");
  }

  Future<List<dynamic>> readJson() async {
    final String response = await rootBundle.loadString(ApiUrls.baseURL);
    print(response.toString());

    return await json.decode(response);
  }
}



//   @override
//   Future<List<TourModel>> getTours() async {
//     try {
//       final response = await _dio.get(
//         'https://d021-158-181-132-208.ngrok-free.app/v1/api/tours',
//       );

//       print('Response status: ${response.statusCode}');
//       print('Response data: ${response.data}');

//       if (response.statusCode == 200) {
        
//         final data =
//             response.data is String
//                 ? json.decode(response.data) as List<dynamic>
//                 : response.data as List<dynamic>;

//         // Фильтруем элементы, чтобы убрать null
//         final filteredData =
//             data
//                 .where((item) => item != null && item is Map<String, dynamic>)
//                 .toList();

//         print('Filtered data: $filteredData');

//         // Преобразуем отфильтрованные данные в модели
//         final result =
//             filteredData
//                 .map((e) => TourModel.fromJson(Map<String, dynamic>.from(e)))
//                 .toList();
//         return result;
//       } else {
//         throw Exception('Ошибка загрузки туров: ${response.statusCode}');
//       }
//     } catch (e, stacktrace) {
//       print('Ошибка при получении туров: $e');
//       print('Стек вызовов: $stacktrace');
//       throw Exception('Ошибка при получении туров: $e');
//     }
//   }
// }
