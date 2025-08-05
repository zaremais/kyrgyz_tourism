import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';

class SignupButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  final bool isLoading;
  const SignupButton({
    required this.onPressed,
    this.title = "",
    super.key,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 60,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: isLoading ? _loading(context) : _initial(context),
    );
  }

  Widget _loading(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: const BorderSide(color: AppColors.buttonForm),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      onPressed: null,
      child: const CircularProgressIndicator(),
    );
  }

  Widget _initial(BuildContext context) {
    final darkTheme = Theme.of(context).brightness == Brightness.dark;
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: const BorderSide(color: AppColors.buttonForm),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      onPressed: onPressed,

      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: darkTheme ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
