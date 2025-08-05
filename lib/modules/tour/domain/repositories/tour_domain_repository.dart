import 'package:kyrgyz_tourism/modules/tour/domain/entities/tour_entity.dart';

abstract class TourDomainRepository {
  Future<List<TourEntity>> getTours(int page, int size, {required String sort});
  Future<List<TourEntity>> getIndividualTour();
}
