import 'dart:developer';
import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/constants/api_urls.dart';
import 'package:kyrgyz_tourism/core/network/dio_client.dart';
import 'package:kyrgyz_tourism/modules/tour/data/models/tour_model.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/entities/filter_tour_entity.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/repositories/tour_domain_repository.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/usecases/get_tours_use_case.dart';

@LazySingleton(as: TourDomainRepository)
class TourRepository extends TourDomainRepository {
  final DioClient _dio;

  TourRepository({required DioClient dio}) : _dio = dio;

  @override
  Future<List<TourModel>> getTours({GetToursParams? params}) async {
    try {
      final queryParams = params?.toJson() ?? {};
      final response = await _dio.get(
        ApiUrls.getTours,
        queryParameters: queryParams,
      );

      if (response.statusCode == 200) {
        final toursData = response.data as List<dynamic>;
        return toursData.map((e) => TourModel.fromJson(e)).toList();
        // final result = <TourModel>[];
        // for (final item in toursData) {
        //   try {
        //     result.add(TourModel.fromJson(item));
        //   } catch (e) {
        //     log('Ошибка парсинга тура: $e');
        //     log('Неверный объект: $item');
        //   }
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
  Future<List<FilterTourEntity>> filterTours() {
    // TODO: implement filterTours
    throw UnimplementedError();
  }

  @override
  Future<String> uploadImage(File params) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }
}
// class TourRepository extends TourDomainRepository {
//   final DioClient _dio;

//   TourRepository({required DioClient dio}) : _dio = dio;

//   @override
//   Future<PaginatedTours> getTours(GetToursParams params) async {
//     try {
//       final response = await _dio.get(
//         ApiUrls.getTours,
//         queryParameters: params.toJson(),
//       );

//       if (response.statusCode == 200) {
//         final dynamic responseData = response.data;
//         List<dynamic> toursData = [];
//         int totalPages = 1;
//         int currentPage = params.page ?? 1;

//         if (responseData is Map<String, dynamic>) {
//           toursData = responseData['content'] as List<dynamic>;
//           totalPages = responseData['totalPages'] ?? 1;
//           currentPage = responseData['currentPage'] ?? currentPage;
//         } else if (responseData is List<dynamic>) {
//           toursData = responseData;
//         } else {
//           throw FormatException(
//             'Неподдерживаемый формат ответа: ${responseData.runtimeType}',
//           );
//         }

//         final result = <TourModel>[];
//         for (final item in toursData) {
//           try {
//             result.add(TourModel.fromJson(item));
//           } catch (e) {
//             log('Ошибка парсинга тура: $e\nНеверный объект: $item');
//           }
//         }

//         return PaginatedTours(
//           tours: result,
//           totalPages: totalPages,
//           currentPage: currentPage,
//         );
//       } else if (response.statusCode == 401) {
//         throw SessionExpiredException();
//       } else {
//         throw ApiException(
//           message: 'Ошибка загрузки туров',
//           statusCode: response.statusCode,
//         );
//       }
//     } on DioException catch (e) {
//       log(
//         'DioError в TourRepository.getTours',
//         error: e,
//         stackTrace: e.stackTrace,
//       );
//       throw ApiException.fromDioError(e);
//     } catch (e, stackTrace) {
//       log(
//         'Неизвестная ошибка в TourRepository.getTours',
//         error: e,
//         stackTrace: stackTrace,
//       );
//       throw ApiException(message: 'Не удалось загрузить туры: ${e.toString()}');
//     }
//   }

//   @override
//   Future<List<TourModel>> getIndividualTour() async {
//     try {
//       final response = await _dio.get(ApiUrls.getIndividualTours);

//       if (response.statusCode == 200) {
//         final toursData = response.data as List<dynamic>;
//         final result = <TourModel>[];
//         for (final item in toursData) {
//           try {
//             result.add(TourModel.fromJson(item));
//           } catch (e) {
//             log('Ошибка парсинга тура: $e');
//             log('Неверный объект: $item');
//           }
//         }

//         log('IndividualTour response: ${response.data}');

//         return result;
//       } else {
//         throw Exception('Ошибка загрузки туров: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Ошибка при получении туров: $e');
//     }
//   }

// @override
// Future<String> uploadImage(File imageFile) async {
//   try {
//     final fileName = imageFile.path.split('/').last;
//     final formData = FormData.fromMap({
//       'file': await MultipartFile.fromFile(
//         imageFile.path,
//         filename: fileName,
//       ),
//     });

//     final result = await _dio.post(
//       ApiUrls.,
//       data: formData,
//       options: Options(
//         headers: {'accept': '*/*', 'Content-Type': 'multipart/form-data'},
//       ),
//     );

//     if (result.statusCode == 200 || result.statusCode == 201) {
//       return result.data['url'];
//     } else {
//       throw Exception('Ошибка загрузки изображения');
//     }
//   } catch (e) {
//     throw Exception('Ошибка при получении изображения');
//   }
// }

// @override
// Future<List<FilterTourEntity>> filterTours() async {
//   final result = await _dio.post(ApiUrls.filterTour);
//   return result.data;
// }

@override
Future<String> uploadImage(File params) {
  // TODO: implement uploadImage
  throw UnimplementedError();
}

@override
Future<List<FilterTourEntity>> filterTours() {
  // TODO: implement filterTours
  throw UnimplementedError();
}
