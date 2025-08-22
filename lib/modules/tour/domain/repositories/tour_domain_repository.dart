import 'package:kyrgyz_tourism/modules/tour/domain/entities/tour_entity.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/usecases/filter_tours_use_case.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/usecases/get_tours_use_case.dart';

abstract class TourDomainRepository {
  Future<List<TourEntity>> getTours(GetToursParams params);
  Future<List<TourEntity>> getIndividualTour();
  Future<List<TourEntity>> filterTours(FilterTourParams params);
}
