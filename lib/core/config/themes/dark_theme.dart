import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: Color.fromARGB(255, 20, 20, 20),
    primary: Colors.grey.shade300,
    secondary: Color.fromARGB(255, 53, 53, 53),
    tertiary: Color.fromARGB(255, 25, 25, 25),
    inversePrimary: Colors.grey.shade300,
  ),

  textTheme: _textTheme,

  dividerTheme: DividerThemeData(color: Colors.grey.withValues(alpha: 0.1)),
);

const _textTheme = TextTheme();
