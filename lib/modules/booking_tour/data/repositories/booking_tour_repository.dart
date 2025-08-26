import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/modules/booking_tour/data/api_service/booking_tour_api_service.dart';

import 'package:kyrgyz_tourism/modules/booking_tour/data/models/booking_tour_model.dart';
import 'package:kyrgyz_tourism/modules/booking_tour/domain/entities/booking_tour_entity.dart';
import 'package:kyrgyz_tourism/modules/booking_tour/domain/repositories/booking_domain_repository.dart';
import 'package:kyrgyz_tourism/modules/booking_tour/domain/usecases/booking_date_use_case.dart';
import 'package:kyrgyz_tourism/modules/booking_tour/domain/usecases/booking_tour_use_case.dart';

@LazySingleton(as: BookingDomainRepository)
class BookingTourRepository extends BookingDomainRepository {
  final BookingTourApiService _bookingTourApi;

  BookingTourRepository({required BookingTourApiService bookingTourApi})
    : _bookingTourApi = bookingTourApi;

  @override
  Future<BookingTourModel> bookingTour(BookingTourParams params) async {
    final response = await _bookingTourApi.bookingTour(params);
    return response;
  }

  @override
  Future<List<BookingTourModel>> bookingUser() async {
    return _bookingTourApi.getUserBookings();
  }

  @override
  Future<List<BookingTourEntity>> bookingDate(BookingDateParams params) {
    return _bookingTourApi.bookingDate(params.tourId);
  }
}
