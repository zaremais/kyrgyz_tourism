import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_sizes.dart';
import 'package:kyrgyz_tourism/generated/l10n.dart';

class SotialLinksWidget extends StatelessWidget {
  const SotialLinksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final darkTheme = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', width: 97, height: 92),
            const SizedBox(height: AppSizes.paddingButtonHeight),

            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(S.of(context).main),
                    Text(S.of(context).aboutthecompany),
                    Text(S.of(context).tours),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(S.of(context).contacts),
                    Text(S.of(context).guides),
                    Text(S.of(context).reviews),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),

            Column(
              children: [
                const SizedBox(height: 64),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.facebook),
                    const SizedBox(width: 10),
                    const Text('takhminam'),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/icon/instagram.png', width: 20),
                    const SizedBox(width: 10),
                    const Text('@takhminam'),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email_outlined),
                    const SizedBox(width: 10),
                    const Text('takhminam@email.com'),
                  ],
                ),
                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/location.png',
                      width: 35,
                      color: darkTheme ? Colors.white : AppColors.text,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        Text(S.of(context).street),
                        Text(S.of(context).address),
                        Text(S.of(context).offfice),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone_outlined),
                    const SizedBox(width: 10),
                    const Text('+996 700 000 000'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
