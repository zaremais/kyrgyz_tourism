import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/generated/l10n.dart';

class ProfileAlertDialog extends StatelessWidget {
  final String title;
  final String text;
  const ProfileAlertDialog({
    super.key,
    required this.text,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.text, width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      title: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      content: Text(
        textAlign: TextAlign.center,
        text,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      ),
      actions: [
        SizedBox(
          width: 120,
          child: ElevatedButton(
            onPressed: () {
              // Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: AppColors.buttonGuide,
            ),
            child: Text(
              S.of(context).yes,
              style: TextStyle(color: AppColors.white),
            ),
          ),
        ),
        SizedBox(width: 20),
        SizedBox(
          width: 120,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: AppColors.buttonTour),
              ),
            ),
            onPressed: () => Navigator.pop(context),
            child: Text(
              S.of(context).not,
              style: TextStyle(color: AppColors.text),
            ),
          ),
        ),
      ],
    );
  }
}
