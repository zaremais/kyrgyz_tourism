import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/repositories/tour_domain_repository.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/usecases/filter_tours_use_case.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/usecases/get_tours_use_case.dart';

import '../../domain/entities/tour_entity.dart';

@LazySingleton(as: TourDomainRepository, env: [Environment.dev])
class MockTourRepository implements TourDomainRepository {
  @override
  Future<List<TourEntity>> getTours(GetToursParams params) async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      TourEntity(
        id: 1,
        title: "Ала-Арча",
        tourDuration: 5,
        placesLeft: 3,
        region: "Чуйская область",
        price: 1500,
        image: "https://picsum.photos/400/200?random=1",
      ),
      TourEntity(
        id: 2,
        title: "Сон-Куль",
        tourDuration: 5,
        placesLeft: 3,
        region: "Нарынская область",
        price: 3000,
        image: "https://picsum.photos/400/200?random=1",
      ),
      TourEntity(
        id: 3,
        title: "Иссык-Куль",
        tourDuration: 5,
        placesLeft: 3,
        region: "Иссык-Кульская область",
        price: 2000,
        image: "https://picsum.photos/400/200?random=1",
      ),
    ];
  }

  @override
  Future<List<TourEntity>> filterTours(FilterTourParams params) {
    throw UnimplementedError();
  }

  @override
  Future<List<TourEntity>> getIndividualTour() {
    throw UnimplementedError();
  }
}
