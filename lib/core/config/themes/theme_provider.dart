import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/themes/dark_theme.dart';
import 'package:kyrgyz_tourism/core/config/themes/light_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  // изначально установливаем его в светлый режим
  ThemeData _themeData = lightMode;

  ThemeProvider() {
    _loadTheme();
  }

  // получаем текущую тему
  ThemeData get themeData => _themeData;

  // сейчас включен тёмный режим?
  bool get isDarkMode => _themeData == darkMode;

  // установливаем тему
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    _saveTheme(themeData == darkMode);

    //обновляем пользовательский интерфейс
    notifyListeners();
  }

  // toggele between dark & light mode
  void toogleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }

  // сохраняем (true = dark, false = light)
  Future<void> _saveTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDark);
  }
  // загружаем тему при инициализации

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDarkMode') ?? false;
    _themeData = isDark ? darkMode : lightMode;
    notifyListeners();
  }
}
