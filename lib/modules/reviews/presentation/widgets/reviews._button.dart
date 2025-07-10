import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_button_widget.dart';
import 'package:kyrgyz_tourism/generated/l10n.dart';

class ReviewsButton extends StatelessWidget {
  const ReviewsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 115,

      child: Card(
        color: AppColors.backgroundtextfield,

        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            SizedBox(height: 10),
            Center(
              child: Text(
                S.of(context).reviews,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 10),
            CustomButtonWidget(
              text: S.of(context).Leaveyourfeedback,
              onPressed: () {
                context.router.replace(ReviewsRoute());
              },
              backgroundColor: AppColors.star,
            ),
          ],
        ),
      ),
    );
  }
}
