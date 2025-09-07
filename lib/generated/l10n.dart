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

  /// `One day tours`
  String get oneTours {
    return Intl.message('One day tours', name: 'oneTours', desc: '', args: []);
  }

  /// `No tours available`
  String get toursavailable {
    return Intl.message(
      'No tours available',
      name: 'toursavailable',
      desc: '',
      args: [],
    );
  }

  /// `See all tours`
  String get seealltours {
    return Intl.message(
      'See all tours',
      name: 'seealltours',
      desc: '',
      args: [],
    );
  }

  /// `Error: ${state.error}`
  String get stateerror {
    return Intl.message(
      'Error: \${state.error}',
      name: 'stateerror',
      desc: '',
      args: [],
    );
  }

  /// `All guides`
  String get allguides {
    return Intl.message('All guides', name: 'allguides', desc: '', args: []);
  }

  /// `Experience:${guide.experience}`
  String get guideexperience {
    return Intl.message(
      'Experience:\${guide.experience}',
      name: 'guideexperience',
      desc: '',
      args: [],
    );
  }

  /// `Reviews: ${guide.reviews}`
  String get guidereviews {
    return Intl.message(
      'Reviews: \${guide.reviews}',
      name: 'guidereviews',
      desc: '',
      args: [],
    );
  }

  /// `Raiting: ${guide.rating}`
  String get guiderating {
    return Intl.message(
      'Raiting: \${guide.rating}',
      name: 'guiderating',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get reviews {
    return Intl.message('Reviews', name: 'reviews', desc: '', args: []);
  }

  /// `Leave your feedback`
  String get Leaveyourfeedback {
    return Intl.message(
      'Leave your feedback',
      name: 'Leaveyourfeedback',
      desc: '',
      args: [],
    );
  }

  /// `Raiting: ${reviews.rating}`
  String get reviewsrating {
    return Intl.message(
      'Raiting: \${reviews.rating}',
      name: 'reviewsrating',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Dark theme`
  String get darktheme {
    return Intl.message('Dark theme', name: 'darktheme', desc: '', args: []);
  }

  /// `Main`
  String get main {
    return Intl.message('Main', name: 'main', desc: '', args: []);
  }

  /// `About company`
  String get aboutthecompany {
    return Intl.message(
      'About company',
      name: 'aboutthecompany',
      desc: '',
      args: [],
    );
  }

  /// `st.Tynystanova`
  String get street {
    return Intl.message('st.Tynystanova', name: 'street', desc: '', args: []);
  }

  /// `3rd floor, offfice 5`
  String get offfice {
    return Intl.message(
      '3rd floor, offfice 5',
      name: 'offfice',
      desc: '',
      args: [],
    );
  }

  /// `BC Business Center`
  String get address {
    return Intl.message(
      'BC Business Center',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Need to contact you?`
  String get needtocontactyou {
    return Intl.message(
      'Need to contact you?',
      name: 'needtocontactyou',
      desc: '',
      args: [],
    );
  }

  /// `Leave your contacts`
  String get leaveyourcontacts {
    return Intl.message(
      'Leave your contacts',
      name: 'leaveyourcontacts',
      desc: '',
      args: [],
    );
  }

  /// `Surename and name`
  String get surnameandname {
    return Intl.message(
      'Surename and name',
      name: 'surnameandname',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phonenumber {
    return Intl.message(
      'Phone number',
      name: 'phonenumber',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Comment: Contact me`
  String get contactme {
    return Intl.message(
      'Comment: Contact me',
      name: 'contactme',
      desc: '',
      args: [],
    );
  }

  /// `Leave a request`
  String get leaverequest {
    return Intl.message(
      'Leave a request',
      name: 'leaverequest',
      desc: '',
      args: [],
    );
  }

  /// `About the company`
  String get aboutcompany {
    return Intl.message(
      'About the company',
      name: 'aboutcompany',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Categories`
  String get categories {
    return Intl.message('Categories', name: 'categories', desc: '', args: []);
  }

  /// `Chat`
  String get chat {
    return Intl.message('Chat', name: 'chat', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Booked`
  String get booked {
    return Intl.message('Booked', name: 'booked', desc: '', args: []);
  }

  /// `Attention! You must upload a new photo`
  String get loadavatar {
    return Intl.message(
      'Attention! You must upload a new photo',
      name: 'loadavatar',
      desc: '',
      args: [],
    );
  }

  /// `Delete Avatar?`
  String get deleteavatar {
    return Intl.message(
      'Delete Avatar?',
      name: 'deleteavatar',
      desc: '',
      args: [],
    );
  }

  /// `Managers`
  String get manager {
    return Intl.message('Managers', name: 'manager', desc: '', args: []);
  }

  /// `Users`
  String get users {
    return Intl.message('Users', name: 'users', desc: '', args: []);
  }

  /// `Black list`
  String get blacklist {
    return Intl.message('Black list', name: 'blacklist', desc: '', args: []);
  }

  /// `Enter first and lastname`
  String get firstandlastname {
    return Intl.message(
      'Enter first and lastname',
      name: 'firstandlastname',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get fullname {
    return Intl.message('Full name', name: 'fullname', desc: '', args: []);
  }

  /// `Enter fullname`
  String get yourfullname {
    return Intl.message(
      'Enter fullname',
      name: 'yourfullname',
      desc: '',
      args: [],
    );
  }

  /// `Upload new photo`
  String get uploadnewphoto {
    return Intl.message(
      'Upload new photo',
      name: 'uploadnewphoto',
      desc: '',
      args: [],
    );
  }

  /// `Delete photo`
  String get deletephoto {
    return Intl.message(
      'Delete photo',
      name: 'deletephoto',
      desc: '',
      args: [],
    );
  }

  /// `Name user`
  String get nameuser {
    return Intl.message('Name user', name: 'nameuser', desc: '', args: []);
  }

  /// `Enter nickeName`
  String get enternickename {
    return Intl.message(
      'Enter nickeName',
      name: 'enternickename',
      desc: '',
      args: [],
    );
  }

  /// `Nickname must start with @`
  String get nicknamestart {
    return Intl.message(
      'Nickname must start with @',
      name: 'nicknamestart',
      desc: '',
      args: [],
    );
  }

  /// `Date of birth`
  String get dateofbirth {
    return Intl.message(
      'Date of birth',
      name: 'dateofbirth',
      desc: '',
      args: [],
    );
  }

  /// `Upload avatar?`
  String get uploadAvatar {
    return Intl.message(
      'Upload avatar?',
      name: 'uploadAvatar',
      desc: '',
      args: [],
    );
  }

  /// `Select date of birth`
  String get selectdateofbirth {
    return Intl.message(
      'Select date of birth',
      name: 'selectdateofbirth',
      desc: '',
      args: [],
    );
  }

  /// `Enter email`
  String get enteremail {
    return Intl.message('Enter email', name: 'enteremail', desc: '', args: []);
  }

  /// `Incorrect email`
  String get Incorrectemail {
    return Intl.message(
      'Incorrect email',
      name: 'Incorrectemail',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message('Phone', name: 'phone', desc: '', args: []);
  }

  /// `Enter phonenumber`
  String get enterphone {
    return Intl.message(
      'Enter phonenumber',
      name: 'enterphone',
      desc: '',
      args: [],
    );
  }

  /// `Gettings started`
  String get gettingstarted {
    return Intl.message(
      'Gettings started',
      name: 'gettingstarted',
      desc: '',
      args: [],
    );
  }

  /// `Senior manager`
  String get seniormanager {
    return Intl.message(
      'Senior manager',
      name: 'seniormanager',
      desc: '',
      args: [],
    );
  }

  /// `Last time of entry`
  String get lasttimeofentry {
    return Intl.message(
      'Last time of entry',
      name: 'lasttimeofentry',
      desc: '',
      args: [],
    );
  }

  /// `Roles`
  String get roles {
    return Intl.message('Roles', name: 'roles', desc: '', args: []);
  }

  /// `Guides description`
  String get guidedescription {
    return Intl.message(
      'Guides description',
      name: 'guidedescription',
      desc: '',
      args: [],
    );
  }

  /// `Profile updated`
  String get profileupdated {
    return Intl.message(
      'Profile updated',
      name: 'profileupdated',
      desc: '',
      args: [],
    );
  }

  /// `Save changes`
  String get savechanges {
    return Intl.message(
      'Save changes',
      name: 'savechanges',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `General information`
  String get generalinfo {
    return Intl.message(
      'General information',
      name: 'generalinfo',
      desc: '',
      args: [],
    );
  }

  /// `Author's tours`
  String get authortours {
    return Intl.message(
      'Author\'s tours',
      name: 'authortours',
      desc: '',
      args: [],
    );
  }

  /// `Filtration`
  String get filter {
    return Intl.message('Filtration', name: 'filter', desc: '', args: []);
  }

  /// `Выбрать регион`
  String get selectedRegion {
    return Intl.message(
      'Выбрать регион',
      name: 'selectedRegion',
      desc: '',
      args: [],
    );
  }

  /// `Однодневный`
  String get oneDay {
    return Intl.message('Однодневный', name: 'oneDay', desc: '', args: []);
  }

  /// `Применить`
  String get apply {
    return Intl.message('Применить', name: 'apply', desc: '', args: []);
  }

  /// `Длительный`
  String get longTerm {
    return Intl.message('Длительный', name: 'longTerm', desc: '', args: []);
  }

  /// `ФИО не указано`
  String get lastname {
    return Intl.message('ФИО не указано', name: 'lastname', desc: '', args: []);
  }

  /// `ДА`
  String get yes {
    return Intl.message('ДА', name: 'yes', desc: '', args: []);
  }

  /// `Нет`
  String get not {
    return Intl.message('Нет', name: 'not', desc: '', args: []);
  }

  /// `Гид`
  String get guide {
    return Intl.message('Гид', name: 'guide', desc: '', args: []);
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
