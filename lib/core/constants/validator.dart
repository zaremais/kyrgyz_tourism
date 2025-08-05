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

String? validatePhone(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Введите номер телефона';
  }

  final digitsOnly = value.replaceAll(RegExp(r'[^\d]'), '');
  if (digitsOnly.length < 10) {
    return 'Номер телефона должен содержать минимум 10 цифр';
  }
  return null;
}

String? validateOtp(String? value) {
  if (value == null || value.isEmpty) return "Введите код";
  if (value.length != 4) return "Код должен содержать 4 цифр";
  return null;
}

String formatPhoneNumber(String phone) {
  final digitsOnly = phone.replaceAll(RegExp(r'[^\d]'), '');

  if (digitsOnly.startsWith('996')) {
    return '+$digitsOnly';
  } else if (digitsOnly.startsWith('0')) {
    return '+996${digitsOnly.substring(1)}';
  } else if (digitsOnly.length == 9) {
    return '+996$digitsOnly';
  }

  return '+$digitsOnly';
}

  // void _handleLogin() async {
  //   if (_formKey.currentState!.validate()) {
  //     final phone = _formatPhoneNumber(_phoneController.text.trim());
  //     final otp = _otpController.text.trim();
  //     final username = _usernameController.text.trim();

  //     if (phone.isEmpty || otp.isEmpty) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text('Пожалуйста, заполните все поля'),
  //           backgroundColor: Colors.orange,
  //         ),
  //       );
  //       return;
  //     }

  //     await _telegramConfirmCubit.confirmOtp(
  //       params: ConfirmOtpParams(
  //         otp: otp,
  //         phoneNumber: phone,
  //         username: username,
  //       ),
  //     );
  //   }
  // }