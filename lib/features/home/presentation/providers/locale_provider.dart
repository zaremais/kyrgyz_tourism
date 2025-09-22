import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/generated/l10n.dart';

@injectable
class LocaleProvider with ChangeNotifier {
  Locale _locale = const Locale('ru');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!S.delegate.supportedLocales.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = const Locale('ru');
    notifyListeners();
  }
}
