import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/modules/booking_tour/domain/entities/booking_tour_entity.dart';
import 'package:kyrgyz_tourism/modules/booking_tour/domain/repositories/booking_domain_repository.dart';

class BookingTourUserUseCase
    extends BaseUsecase<List<BookingTourEntity>, NoParams> {
  final BookingDomainRepository _repository;

  BookingTourUserUseCase({required BookingDomainRepository repository})
    : _repository = repository;

  @override
  Future<List<BookingTourEntity>> execute({required NoParams params}) async {
    return _repository.bookingUser();
  }
}
