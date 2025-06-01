import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_sizes.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color backgroundColor;

  const CustomButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: AppSizes.paddingButtonWidth,
        height: AppSizes.paddingButtonHeight,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(AppSizes.borderRadiusTen),
              ),
            ),
          ),

          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
