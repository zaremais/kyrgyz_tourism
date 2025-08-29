import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_sizes.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_drawer_tile.dart';
import 'package:kyrgyz_tourism/core/widgets/language_switch_widget.dart';
import 'package:kyrgyz_tourism/generated/l10n.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: 30),
        Center(
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.clear, size: AppSizes.paddingBig),
          ),
        ),
        const SizedBox(height: 100),
        Column(
          children: [
            Center(
              child: CustomDrawerTile(
                title: S.of(context).aboutcompany,

                onTap: () {
                  context.router.push(HomeRoute());
                  Navigator.pop(context);
                },
              ),
            ),
            CustomDrawerTile(
              title: S.of(context).tours,

              onTap: () {
                context.router.navigate(ToursRoute());
                Navigator.pop(context);
              },
            ),
            CustomDrawerTile(
              title: S.of(context).contacts,

              onTap: () {
                context.router.push(SettingsRoute());
                Navigator.pop(context);
              },
            ),
            CustomDrawerTile(
              title: S.of(context).guides,

              onTap: () {
                context.router.push(GuideRoute());
                Navigator.pop(context);
              },
            ),
            CustomDrawerTile(
              title: S.of(context).login,

              onTap: () {
                context.router.push(AuthRoute());
                Navigator.pop(context);
              },
            ),
            CustomDrawerTile(
              title: S.of(context).settings,

              onTap: () {
                context.router.push(SettingsRoute());
                Navigator.pop(context);
              },
            ),
          ],
        ),

        const SizedBox(height: 100),
        SizedBox(height: 50),
        Center(child: const LanguageSwitchWidget()),
      ],
    );
  }
}
