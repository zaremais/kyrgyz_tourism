import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/modules/guides/domain/repositories/guide_domain_repository.dart';

import '../models/guide_model.dart';
import '../../../../core/network/dio_client.dart';

@LazySingleton(as: GuideDomainRepository)
class GuideRepository extends GuideDomainRepository {
  final DioClient _dio;

  GuideRepository({required DioClient dio}) : _dio = dio;

  @override
  Future<List<GuideModel>> getGuide() async {
    try {
      final response = await _dio.get('http://34.18.76.114/v1/api/guides');
      if (response.statusCode == 200) {
        final guides = response.data as List<dynamic>;
        // print('API Response: ${response.data}');
        return guides.map((e) => GuideModel.fromJson(e)).toList();
      } else {
        throw Exception('Ошибка загрузки гидов: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Ошибка при получении гидов: $e');
    }
  }
}
