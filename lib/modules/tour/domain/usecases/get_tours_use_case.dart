import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';

import 'package:kyrgyz_tourism/modules/tour/domain/entities/tour_entity.dart';

import '../repositories/tour_domain_repository.dart';

@injectable
class GetToursUseCase extends BaseUsecase<List<TourEntity>, void> {
  final TourDomainRepository _repository;

  GetToursUseCase({required TourDomainRepository repository})
    : _repository = repository;

  @override
  Future<List<TourEntity>> execute({required params}) async {
    return _repository.getTours();
  }
}
