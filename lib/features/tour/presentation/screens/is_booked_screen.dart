import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/features/booking_tour/presentation/widgets/tour_booking_form.dart';

@RoutePage()
class IsBookedScreen extends StatelessWidget {
  const IsBookedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: TourBookingForm());
  }
}
