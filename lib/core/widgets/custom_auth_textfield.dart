import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';

class CustomAuthTextfield extends StatelessWidget {
  const CustomAuthTextfield({
    super.key,
    required this.hintText,
    required this.onTap,
  });
  final String hintText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Container(
        width: 360,
        height: 50,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              spreadRadius: -1,
              offset: Offset(-1, -1),
              blurRadius: 5,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: AppColors.backgroundtextfield,
        ),
        child: TextField(
          onTap: onTap,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}
