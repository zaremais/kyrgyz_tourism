import '../entities/tour_entity.dart';

abstract class TourDomainRepository {
  Future<List<TourEntity>> getTours();
  Future<List<TourEntity>> getIndividualTour();
}
