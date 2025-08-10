import 'package:kyrgyz_tourism/modules/tour_booking/domain/entities/booking_entity.dart';
import 'package:kyrgyz_tourism/modules/tour_booking/domain/usecases/booking_tour_use_case.dart';

abstract class BookingTourDomainRepository {
  Future<BookingEntity> bookingTour(BookingTourParams params);
}
