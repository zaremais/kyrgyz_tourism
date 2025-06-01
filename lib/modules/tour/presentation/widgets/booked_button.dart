import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_sizes.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/entities/tour_entity.dart';

class BookButton extends StatelessWidget {
  final TourEntity tour;

  const BookButton({super.key, required this.tour});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.router.push(TourDetailsRoute(tour: tour));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white.withValues(alpha: 0.8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(AppSizes.borderRadiusMedium),
            bottomLeft: Radius.circular(AppSizes.borderRadiusMedium),
          ),
        ),
      ),
      child: Center(
        child: Text(
          "Забронировать",
          style: TextStyle(
            fontSize: AppSizes.mediumFontSize,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
