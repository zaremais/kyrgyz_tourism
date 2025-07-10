import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/generated/l10n.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final TabsRouter tabsRouter;
  final void Function(int index) onTap;
  const CustomBottomNavigationBar({
    super.key,
    required this.tabsRouter,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Stack(
      alignment: Alignment.center,
      children: [
        BottomNavigationBar(
          selectedItemColor: AppColors.text,
          unselectedItemColor: AppColors.text,
          unselectedLabelStyle: TextStyle(fontSize: 8),
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(fontSize: 8),
          currentIndex: tabsRouter.activeIndex,
          onTap: (index) {
            if (index == 2) return;
            onTap(index > 2 ? index - 1 : index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icon/home.png',
                color: isDark ? Colors.white : Colors.black,
                width: 14,
                height: 14,
              ),
              label: S.of(context).home,
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icon/category.png',
                color: isDark ? Colors.white : Colors.black,
                width: 14,
                height: 14,
              ),
              label: S.of(context).categories,
            ),
            BottomNavigationBarItem(icon: SizedBox(), label: ''),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icon/message.png',
                color: isDark ? Colors.white : Colors.black,
                width: 14,
                height: 14,
              ),
              label: S.of(context).chat,
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icon/profile.png',
                width: 14,
                height: 14,
                color: isDark ? Colors.white : Colors.black,
              ),
              label: S.of(context).profile,
            ),
          ],
        ),

        Positioned(
          top: 10,
          child: Image.asset('assets/images/logo.png', width: 35, height: 35),
        ),
      ],
    );
  }
}
