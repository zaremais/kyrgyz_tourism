import 'package:kyrgyz_tourism/modules/tour/domain/usecases/get_tours_use_case.dart';

import '../entities/tour_entity.dart';

abstract class TourDomainRepository {
  Future<List<TourEntity>> getTours({GetToursParams? params});
  Future<List<TourEntity>> getIndividualTour();
}
