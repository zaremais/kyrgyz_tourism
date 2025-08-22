import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/modules/booking_tour/domain/entities/booking_tour_entity.dart';
import 'package:kyrgyz_tourism/modules/booking_tour/domain/repositories/booking_domain_repository.dart';

@injectable
class BookingTourUseCase
    extends BaseUsecase<BookingTourEntity, BookingTourParams> {
  final BookingDomainRepository _repository;

  BookingTourUseCase({required BookingDomainRepository repository})
    : _repository = repository;

  @override
  Future<BookingTourEntity> execute({required BookingTourParams params}) async {
    return await _repository.bookingTour(params);
  }
}

class BookingTourParams {
  final int tourId;
  final String selectedDate;
  final int numberOfPeople;
  final String promoCode;

  BookingTourParams({
    required this.tourId,
    required this.selectedDate,
    required this.numberOfPeople,
    required this.promoCode,
  });

  JSON toJson() {
    return {
      'tourId': tourId,
      'selectedDate': selectedDate,
      'numberOfPeople': numberOfPeople,
      'promoCode': promoCode,
    };
  }
}
