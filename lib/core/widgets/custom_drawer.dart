import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/bloc/theme/theme_cubit.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_sizes.dart';
import 'package:kyrgyz_tourism/core/widgets/language_switch_widget.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = context.watch<ThemeCubit>().state.isDark;
    final List<String> drawerItems = [
      'О компании',
      'Туры',
      'Контакты',
      'Гиды',
      'Вход',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SwitchListTile(
          value: isDarkTheme,
          onChanged: (value) => setThemeBrightness(context, value),
        ),
        SizedBox(height: 30),
        Center(
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.clear, size: AppSizes.paddingBig),
          ),
        ),
        const SizedBox(height: 100),
        ...drawerItems.map((title) => _buildListTile(context, title)),
        const SizedBox(height: 100),
        SizedBox(height: 50),
        const LanguageSwitchWidget(),
      ],
    );
  }

  void setThemeBrightness(BuildContext context, bool value) {
    context.read<ThemeCubit>().setThemeBrightness(
      value ? Brightness.dark : Brightness.light,
    );
  }

  Widget _buildListTile(BuildContext context, String title) {
    return ListTile(
      title: Center(
        child: Text(title, style: TextStyle(fontSize: AppSizes.logoFontSize)),
      ),
      onTap: () => Navigator.pop(context),
    );
  }
}
