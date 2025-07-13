import 'package:email_validator/email_validator.dart';

String? validateEmail(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Почта обязательна';
  }
  if (!EmailValidator.validate(value.trim())) {
    return 'Введите корректную почту';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.length < 8) {
    return 'Минимум 8 символов';
  }
  if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return 'Добавьте заглавную букву';
  }
  if (!RegExp(r'[0-9]').hasMatch(value)) {
    return 'Добавьте цифру';
  }
  if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
    return 'Добавьте спецсимвол';
  }
  return null;
}

String? validateNikeName(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Логин обязателен';
  }
  if (value.length < 3) {
    return 'Минимум 3 символа';
  }
  return null;
}
