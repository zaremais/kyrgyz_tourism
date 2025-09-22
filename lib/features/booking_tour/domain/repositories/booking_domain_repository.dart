import 'package:kyrgyz_tourism/features/booking_tour/domain/entities/booking_tour_entity.dart';
import 'package:kyrgyz_tourism/features/booking_tour/domain/usecases/booking_date_use_case.dart';
import 'package:kyrgyz_tourism/features/booking_tour/domain/usecases/booking_tour_use_case.dart';

abstract class BookingDomainRepository {
  Future<BookingTourEntity> bookingTour(BookingTourParams params);
  Future<List<BookingTourEntity>> bookingUser();
  Future<List<BookingTourEntity>> bookingDate(BookingDateParams params);
}
