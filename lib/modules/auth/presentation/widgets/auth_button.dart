import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_sizes.dart';
import 'package:kyrgyz_tourism/core/config/themes/theme.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const AuthButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(
            AppSizes.paddingTextfildWidth,
            AppSizes.paddingBottom,
          ),
          backgroundColor: AppColors.buttonForm,
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.paddingMedium,
            horizontal: AppSizes.paddingLarge,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusTen),
          ),
        ),

        child: Text(
          text,
          style: FontStyles.bodyInfo.copyWith(color: AppColors.text),
        ),
      ),
    );
  }
}
