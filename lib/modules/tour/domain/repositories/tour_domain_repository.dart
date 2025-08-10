import 'package:kyrgyz_tourism/modules/tour/domain/entities/tour_entity.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/usecases/filter_tours_use_case.dart';

abstract class TourDomainRepository {
  Future<List<TourEntity>> getTours(int page, int size, {required String sort});
  Future<List<TourEntity>> getIndividualTour();
  Future<List<TourEntity>> filterTours(FilterTourParams params);
}
