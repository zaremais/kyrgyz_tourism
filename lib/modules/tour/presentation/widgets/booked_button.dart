import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_sizes.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/entities/tour_entity.dart';

class BookedButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final TourEntity tour;

  const BookedButton({
    super.key,
    required this.tour,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white.withValues(alpha: 0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(AppSizes.borderRadiusMedium),
            bottomLeft: Radius.circular(AppSizes.borderRadiusMedium),
          ),
        ),
      ),
      child: Center(
        child: Text(
          text,
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
