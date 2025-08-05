import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/entities/tour_entity.dart';

import '../repositories/tour_domain_repository.dart';

@injectable
class GetToursUseCase extends BaseUsecase<List<TourEntity>, GetToursParams> {
  final TourDomainRepository _repository;

  GetToursUseCase({required TourDomainRepository repository})
    : _repository = repository;

  @override
  Future<List<TourEntity>> execute({required GetToursParams params}) async {
    return await _repository.getTours(
      params.page,
      params.size,
      sort: params.sort,
    );
  }
}

class GetToursParams {
  final int page;
  final int size;
  final String sort;

  GetToursParams({required this.page, required this.size, required this.sort});

  JSON toJson() {
    return {'page': page, 'size': size, 'sort': sort};
  }
}
