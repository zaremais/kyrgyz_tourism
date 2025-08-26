import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';

import 'package:kyrgyz_tourism/modules/booking_tour/domain/entities/booking_tour_entity.dart';
import 'package:kyrgyz_tourism/modules/booking_tour/domain/repositories/booking_domain_repository.dart';

@injectable
class BookingDateUseCase
    extends BaseUsecase<List<BookingTourEntity>, BookingDateParams> {
  final BookingDomainRepository _repository;

  BookingDateUseCase({required BookingDomainRepository repository})
    : _repository = repository;

  @override
  Future<List<BookingTourEntity>> execute({
    required BookingDateParams params,
  }) async {
    return await _repository.bookingDate(params);
  }
}

class BookingDateParams {
  final int tourId;

  BookingDateParams({required this.tourId});
  JSON toJson() {
    return {'tourId': tourId};
  }
}
