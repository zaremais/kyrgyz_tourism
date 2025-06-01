import 'package:flutter/material.dart';


class LanguageSwitchNotifier extends ValueNotifier<bool> {
  LanguageSwitchNotifier() : super(true); 

  void toggleLanguage() => value = !value;
}