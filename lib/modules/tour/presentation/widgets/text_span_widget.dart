import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';

class TextSpanWidget extends StatelessWidget {
  final String hintText;
  const TextSpanWidget({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Text.rich(
        TextSpan(
          text: hintText,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),

          children: const [
            TextSpan(text: '*', style: TextStyle(color: AppColors.error)),
          ],
        ),
      ),
    );
  }
}
