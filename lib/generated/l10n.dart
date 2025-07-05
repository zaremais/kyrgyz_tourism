// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Tours`
  String get tours {
    return Intl.message('Tours', name: 'tours', desc: '', args: []);
  }

  /// `All tours`
  String get alltours {
    return Intl.message('All tours', name: 'alltours', desc: '', args: []);
  }

  /// `Best tour`
  String get besttour {
    return Intl.message('Best tour', name: 'besttour', desc: '', args: []);
  }

  /// `Individual tours`
  String get individualtours {
    return Intl.message(
      'Individual tours',
      name: 'individualtours',
      desc: '',
      args: [],
    );
  }

  /// `About the company`
  String get companies {
    return Intl.message(
      'About the company',
      name: 'companies',
      desc: '',
      args: [],
    );
  }

  /// `Featured Tours`
  String get featuredTours {
    return Intl.message(
      'Featured Tours',
      name: 'featuredTours',
      desc: '',
      args: [],
    );
  }

  /// `Contacts`
  String get contacts {
    return Intl.message('Contacts', name: 'contacts', desc: '', args: []);
  }

  /// `Guides`
  String get guides {
    return Intl.message('Guides', name: 'guides', desc: '', args: []);
  }

  /// `Completed Dialogues`
  String get completedDialogues {
    return Intl.message(
      'Completed Dialogues',
      name: 'completedDialogues',
      desc: '',
      args: [],
    );
  }

  /// `Current Dialogues`
  String get currentDialogues {
    return Intl.message(
      'Current Dialogues',
      name: 'currentDialogues',
      desc: '',
      args: [],
    );
  }

  /// `Start a new dialogue`
  String get startNewDialogue {
    return Intl.message(
      'Start a new dialogue',
      name: 'startNewDialogue',
      desc: '',
      args: [],
    );
  }

  /// `All tours`
  String get allTours {
    return Intl.message('All tours', name: 'allTours', desc: '', args: []);
  }

  /// `Best tour`
  String get bestTours {
    return Intl.message('Best tour', name: 'bestTours', desc: '', args: []);
  }

  /// `Support chat`
  String get supportChat {
    return Intl.message(
      'Support chat',
      name: 'supportChat',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
