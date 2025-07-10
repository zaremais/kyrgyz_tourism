import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/themes/dark_theme.dart';
import 'package:kyrgyz_tourism/core/config/themes/light_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;
  static const _themeKey = 'isDarkMode';

  ThemeProvider() {
    _loadTheme();
  }

  ThemeData get themeData => _themeData;
  bool get isDarkMode => _themeData == darkMode;

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool(_themeKey) ?? false;
    _themeData = isDark ? darkMode : lightMode;
    notifyListeners();
  }

  // set themeData(ThemeData themeData) {
  //   _themeData = themeData;
  //   notifyListeners();
  // }

  Future<void> toogleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    if (_themeData == lightMode) {
      _themeData = darkMode;
      await prefs.setBool(_themeKey, true);
    } else {
      _themeData = lightMode;
      await prefs.setBool(_themeKey, false);
    }
    notifyListeners();
  }
}
