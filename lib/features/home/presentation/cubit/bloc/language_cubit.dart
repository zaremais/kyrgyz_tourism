import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:bloc/bloc.dart';

abstract class LanguageEvent {}

@injectable
class ToggleLanguageEvent extends LanguageEvent {}

class LanguageBloc extends Bloc<LanguageEvent, Locale> {
  LanguageBloc() : super(const Locale('ru')) {
    on<ToggleLanguageEvent>(_onToggleLanguage);
    _loadSavedLanguage();
  }

  Future<void> _loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final langCode = prefs.getString('language') ?? 'ru';
    // ignore: invalid_use_of_visible_for_testing_member
    emit(Locale(langCode));
  }

  Future<void> _onToggleLanguage(
    ToggleLanguageEvent event,
    Emitter<Locale> emit,
  ) async {
    final newLocale =
        state.languageCode == 'ru' ? const Locale('en') : const Locale('ru');

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', newLocale.languageCode);

    emit(newLocale);
  }
}
