import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';

final darkTheme = ThemeData(
  appBarTheme: AppBarTheme(backgroundColor: Colors.grey.shade900, elevation: 0),
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    primary: Colors.grey.shade500,
    secondary: Color.fromARGB(255, 53, 53, 53),
    tertiary: Color.fromARGB(255, 25, 25, 25),
    inversePrimary: Colors.grey.shade300,
    seedColor: AppColors.primaryColor,
  ),
  scaffoldBackgroundColor: Colors.grey.shade900,
  textTheme: _textTheme,
  useMaterial3: true,
  dividerTheme: DividerThemeData(color: Colors.grey.withValues(alpha: 0.1)),
);

const _textTheme = TextTheme();
