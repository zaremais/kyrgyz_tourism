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
  final void Function(String)? onChanged;
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
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.backgroundtextfield,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(-3, -3),
          ),
        ],
      ),
      child: TextFormField(
        onChanged: onChanged,
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixText: prefixText,
          labelText: labelText,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusForm),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.textDescription,
            fontSize: AppSizes.paddingMedium,
          ),
          filled: true,
          fillColor: AppColors.whiteSmoke,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusForm),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
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
