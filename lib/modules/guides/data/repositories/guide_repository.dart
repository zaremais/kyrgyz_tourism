import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/constants/api_urls.dart';
import 'package:kyrgyz_tourism/modules/guides/data/models/guide_model.dart';
import 'package:kyrgyz_tourism/modules/guides/data/models/paged_response.dart';
import 'package:kyrgyz_tourism/modules/guides/domain/repositories/guide_domain_repository.dart';

import '../../../../core/network/dio_client.dart';

@LazySingleton(as: GuideDomainRepository)
class GuideRepository extends GuideDomainRepository {
  final DioClient _dio;

  GuideRepository({required DioClient dio}) : _dio = dio;

  @override
  Future<PagedResponse<GuideModel>> getGuides(
    int size,
    int page,
    String sort,
  ) async {
    final response = await _dio.get(
      ApiUrls.getGuides,
      queryParameters: {'page': page, 'size': size, 'sort': sort},
    );
    final data = response.data as Map<String, dynamic>;
    return PagedResponse<GuideModel>.fromJson(
      data,
      (json) => GuideModel.fromJson(json),
    );
  }

  // @override
  // Future<PaginatedResponse<GuideModel>> getGuides(
  //    int page,
  //    int size,
  //   {required String sort}
  // ) async {
  //   final response = await _dio.get(
  //     ApiUrls.getGuides,
  //     queryParameters: {
  //       'page': page,
  //       'size': size,
  //       'sort': sort,
  //     },
  //   );

  //   return PaginatedResponse<GuideModel>.fromJson(
  //     response.data,
  //     (json) => GuideModel.fromJson(json),
  //   );
  // }
}


//   @override
//   Future<PaginateGuideModel<GuideModel>> getGuides(int page,
//   int size,
//     String sort) async {
    
//       final response = await _dio.get(
//         ApiUrls.getGuides,
//         queryParameters: {
//         'page': page,
//         'size': size,
//         'sort': sort,
//         },
//         options: Options(headers: {'accept': '*/*'}),
//       );
//     return PaginateGuideModel<GuideModel>.fromJson(
//       response.data,
//       (json) => GuideModel.fromJson(json));
// }

    