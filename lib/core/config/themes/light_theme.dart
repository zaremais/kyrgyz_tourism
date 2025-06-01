import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';

final lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    primary: Colors.grey.shade500,
    secondary: Colors.grey.shade200,
    tertiary: Colors.white,
    inversePrimary: Colors.grey.shade900,
    seedColor: AppColors.primaryColor,
  ),
  scaffoldBackgroundColor: Colors.white,
  textTheme: _textTheme,
  useMaterial3: true,
  dividerTheme: DividerThemeData(color: Colors.grey.withValues(alpha: 0.1)),
);

const _textTheme = TextTheme();
