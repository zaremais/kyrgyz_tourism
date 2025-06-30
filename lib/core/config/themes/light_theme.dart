import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Colors.white,
    primary: Colors.grey.shade300,
    secondary: Colors.grey.shade200,
    tertiary: Colors.white,
    inversePrimary: Colors.grey.shade900,
  ),

  textTheme: _textTheme,

  dividerTheme: DividerThemeData(color: Colors.grey.withValues(alpha: 0.1)),
);

const _textTheme = TextTheme();
