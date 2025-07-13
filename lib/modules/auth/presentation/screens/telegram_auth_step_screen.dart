import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/core/constants/api_urls.dart';
import 'package:kyrgyz_tourism/core/di/service_locator.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/telegram_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/confirm_otp_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/cubit/telegram_auth_cubit.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/widgets/auth_input_textfield.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class TelegramAuthStepScreen extends StatefulWidget {
  const TelegramAuthStepScreen({super.key});

  @override
  State<TelegramAuthStepScreen> createState() => _TelegramAuthStepScreenState();
}

class _TelegramAuthStepScreenState extends State<TelegramAuthStepScreen> {
  final _otpController = TextEditingController();
  final _phoneController = TextEditingController();
  final _telegramAuthCubit = di<TelegramAuthCubit>();

  @override
  void dispose() {
    _otpController.dispose();
    _phoneController.dispose();
    _telegramAuthCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _telegramAuthCubit,
      child: BlocConsumer<TelegramAuthCubit, BaseState<TelegramEntity>>(
        listener: (context, state) {
          if (state.status == StateStatus.success && state.isOtpConfirmed) {
            context.router.replace(const ChatRoute());
          } else if (state.status == StateStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage ?? 'Произошла ошибка')),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppBar(title: const Text("Вход через Telegram")),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton.icon(
                    onPressed: () async {
                      const botUrl = ApiUrls.getOtpLink;
                      final uri = Uri.parse(botUrl);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(
                          uri,
                          mode: LaunchMode.externalApplication,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Не удалось открыть Telegram'),
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.telegram),
                    label: const Text("Перейти в Telegram-бота"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  AuthInputTextfield(
                    controller: _phoneController,
                    hintText: "Введите ваш номер телефона",
                    obscureText: false,
                    validator: (value) => null,
                  ),
                  const SizedBox(height: 12),
                  AuthInputTextfield(
                    controller: _otpController,
                    hintText: "Введите код из Telegram",
                    obscureText: false,
                    validator: (value) => null,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () async {
                      if (_phoneController.text.isNotEmpty &&
                          _otpController.text.isNotEmpty) {
                        await _telegramAuthCubit.confirmOtp(
                          params: ConfirmOtpParams(
                            otp: _otpController.text.trim(),
                            phoneNumber: _phoneController.text.trim(),
                            username: '',
                          ),
                        );
                      }
                    },
                    child: const Text("Подтвердить и войти"),
                  ),
                  const SizedBox(height: 16),
                  if (state.otpCode != null)
                    Text(
                      "OTP: ${state.otpCode}",
                      style: const TextStyle(fontSize: 16, color: Colors.green),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
