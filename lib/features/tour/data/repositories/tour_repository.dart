import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/features/tour/data/api_service/tour_api_service.dart';
import 'package:kyrgyz_tourism/features/tour/data/models/tour_model.dart';
import 'package:kyrgyz_tourism/features/tour/domain/repositories/tour_domain_repository.dart';
import 'package:kyrgyz_tourism/features/tour/domain/usecases/filter_tours_use_case.dart';
import 'package:kyrgyz_tourism/features/tour/domain/usecases/get_tours_use_case.dart';

@LazySingleton(as: TourDomainRepository)
class TourRepository extends TourDomainRepository {
  final TourApiService _tourApi;

  TourRepository({required TourApiService tourApi}) : _tourApi = tourApi;

  @override
  Future<List<TourModel>> getTours(GetToursParams params) async {
    final response = await _tourApi.getTours(
      page: params.page,
      size: params.size,
      sort: params.sort,
    );
    return response;
  }

  @override
  Future<List<TourModel>> getIndividualTour() async {
    final response = await _tourApi.getIndividualTour();

    return response;
  }

  @override
  Future<List<TourModel>> filterTours(FilterTourParams params) async {
    try {
      final response = await _tourApi.filterTours(params);
      return response;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return <TourModel>[];
      } else {
        rethrow;
        }
      
    } catch (e) {
      final message = e.toString();
      if (message.contains('404')) {
        return <TourModel>[];
      }
      throw Exception('Ошибка при фильтрации туров: $e');
    }
  }
}
