import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_sizes.dart';

class AuthInputTextfield extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? label;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? prefixText;
  final String? labelText;
  final void Function()? onTap;
  final FocusNode? focusNode;

  const AuthInputTextfield({
    super.key,
    this.focusNode,
    this.hintText,
    required this.controller,
    this.validator,
    this.label,
    required this.obscureText,
    this.suffixIcon,
    this.prefixText,
    this.labelText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 1,
            offset: Offset(-1, -1),
            spreadRadius: -17,
          ),
        ],
      ),
      child: TextFormField(
        onTap: onTap,
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixText: prefixText,
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusForm),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.textDescription,
            fontSize: AppSizes.paddingMedium,
          ),
          filled: true,

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusForm),
            borderSide: BorderSide(color: Colors.black12),
          ),
          label: RichText(
            text: TextSpan(
              text: hintText,
              style: TextStyle(
                color: AppColors.textDescription,
                fontSize: AppSizes.paddingMedium,
              ),
              children: const [
                TextSpan(text: ' *', style: TextStyle(color: AppColors.error)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
