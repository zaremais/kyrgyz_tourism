import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_sizes.dart';
import 'package:kyrgyz_tourism/core/widgets/language_switch_widget.dart';

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
        _buildListTile(context),
        const SizedBox(height: 100),
        SizedBox(height: 50),
        const LanguageSwitchWidget(),
      ],
    );
  }
}

Widget _buildListTile(BuildContext context) {
  return Column(
    children: [
      ListTile(
        title: Center(
          child: Text(
            'О компании',
            style: TextStyle(fontSize: AppSizes.logoFontSize),
          ),
        ),
        onTap: () {
          context.router.push(HomeRoute());
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Center(
          child: Text(
            'Туры',
            style: TextStyle(fontSize: AppSizes.logoFontSize),
          ),
        ),
        onTap: () {
          context.router.push(ToursRoute());
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Center(
          child: Text(
            'Контакты',
            style: TextStyle(fontSize: AppSizes.logoFontSize),
          ),
        ),
        onTap: () {
          context.router.push(SettingsRoute());
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Center(
          child: Text(
            'Гиды',
            style: TextStyle(fontSize: AppSizes.logoFontSize),
          ),
        ),
        onTap: () {
          context.router.push(GuideRoute());
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Center(
          child: Text(
            'Вход',
            style: TextStyle(fontSize: AppSizes.logoFontSize),
          ),
        ),
        onTap: () {
          context.router.push(AuthRoute());
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Center(
          child: Text(
            'Settings',
            style: TextStyle(fontSize: AppSizes.logoFontSize),
          ),
        ),
        onTap: () {
          context.router.push(SettingsRoute());
          Navigator.pop(context);
        },
      ),
    ],
  );
}
