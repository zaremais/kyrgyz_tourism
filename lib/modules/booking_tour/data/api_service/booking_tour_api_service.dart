import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/constants/api_urls.dart';

import 'package:kyrgyz_tourism/modules/booking_tour/data/models/booking_tour_model.dart';
import 'package:kyrgyz_tourism/modules/booking_tour/domain/usecases/booking_tour_use_case.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'booking_tour_api_service.g.dart';

@RestApi(baseUrl: ApiUrls.baseUrl)
@injectable
abstract class BookingTourApiService {
  @factoryMethod
  factory BookingTourApiService(Dio dio, {@Named("BaseUrl") String baseUrl}) =
      _BookingTourApiService;

  @POST("/v1/api/bookings")
  Future<BookingTourModel> bookingTour(@Body() BookingTourParams params);

  @GET('/v1/api/bookings/user')
  Future<List<BookingTourModel>> getUserBookings();

  @GET('/v1/api/bookings/available-dates/{tourId}')
  Future<List<BookingTourModel>> bookingDate(@Path('tourId') int tourId);
}
