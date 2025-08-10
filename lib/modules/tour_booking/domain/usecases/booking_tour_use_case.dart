import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/modules/tour_booking/domain/entities/booking_entity.dart';
import 'package:kyrgyz_tourism/modules/tour_booking/domain/repositories/booking_tour_domain_repository.dart';

class BookingTourUseCase extends BaseUsecase<BookingEntity, BookingTourParams> {
  final BookingTourDomainRepository _repository;

  BookingTourUseCase({required BookingTourDomainRepository repository})
    : _repository = repository;

  @override
  Future<BookingEntity> execute({required BookingTourParams params}) async {
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
