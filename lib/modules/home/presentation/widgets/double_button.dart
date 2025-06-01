import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_sizes.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';

class DoubleButton extends StatelessWidget {
  final ValueNotifier<TourFilter> selectedType;

  const DoubleButton({super.key, required this.selectedType});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return ValueListenableBuilder<TourFilter>(
      valueListenable: selectedType,
      builder: (context, value, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => selectedType.value = TourFilter.best,

                  style: TextButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                          AppSizes.borderRadiusOneTour,
                        ),
                        topLeft: Radius.circular(AppSizes.borderRadiusOneTour),
                      ),
                    ),

                    backgroundColor:
                        value == TourFilter.best
                            ? AppColors.buttonGuide
                            : (isDarkTheme
                                ? Colors.grey.shade900
                                : Colors.white),
                  ),
                  child: Text(
                    "Лучшие туры",
                    style: TextStyle(
                      color:
                          value == TourFilter.best
                              ? Colors.white
                              : (isDarkTheme ? Colors.white : Colors.black),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () => selectedType.value = TourFilter.oneDay,
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(
                          AppSizes.borderRadiusOneTour,
                        ),
                        topRight: Radius.circular(AppSizes.borderRadiusOneTour),
                      ),
                    ),
                    backgroundColor:
                        value == TourFilter.oneDay
                            ? AppColors.buttonGuide
                            : (isDarkTheme
                                ? Colors.grey.shade900
                                : Colors.white),
                  ),
                  child: Text(
                    "Однодневные туры",
                    style: TextStyle(
                      color:
                          value == TourFilter.oneDay
                              ? Colors.white
                              : (isDarkTheme ? Colors.white : Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
