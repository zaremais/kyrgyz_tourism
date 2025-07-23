import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/entities/tour_entity.dart';

import '../repositories/tour_domain_repository.dart';

@injectable
class GetToursUseCase extends BaseUsecase<List<TourEntity>, GetToursParams> {
  final TourDomainRepository _repository;

  GetToursUseCase({required TourDomainRepository repository})
    : _repository = repository;

  @override
  Future<List<TourEntity>> execute({required GetToursParams params}) async {
    return await _repository.getTours(params: params);
  }
}

class GetToursParams {
  final int? page;
  final int? size;
  final String sort;

  GetToursParams({this.page, this.size, this.sort = 'averageRating.desc'});

  Map<String, dynamic> toJson() => {
    if (page != null) 'page': page,
    if (size != null) 'size': size,
    'sort': sort,
  };
}
