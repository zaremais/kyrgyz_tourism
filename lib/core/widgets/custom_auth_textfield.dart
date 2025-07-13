import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';

class CustomAuthTextfield extends StatelessWidget {
  const CustomAuthTextfield({
    super.key,
    required this.hint,
    required this.onTap,
  });
  final String hint;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final darkTheme = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Container(
        // width: 360,
        height: 50,
        decoration: BoxDecoration(
          color:
              darkTheme ? Colors.grey.shade900 : AppColors.backgroundtextfield,
          border: Border.all(color: Colors.grey.shade100),
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              offset: Offset(-1, -1),
              blurRadius: 1,
              color: Colors.grey.shade300,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          onTap: onTap,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,

              borderRadius: BorderRadius.circular(10),
            ),
            // hintText: hintText,
            hint: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Center(child: Text(hint)),
            ),
            hintStyle: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
