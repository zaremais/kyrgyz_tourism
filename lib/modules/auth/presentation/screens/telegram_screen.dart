import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_sizes.dart';
import 'package:kyrgyz_tourism/core/config/themes/theme.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/main.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/telegram_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/confirm_otp_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/send_otp_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/cubit/telegram_auth_cubit.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/widgets/auth_input_textfield.dart';

@RoutePage()
class TelegramScreen extends StatefulWidget {
  const TelegramScreen({super.key});

  @override
  State<TelegramScreen> createState() => _TelegramScreenState();
}

class _TelegramScreenState extends State<TelegramScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _chatController = TextEditingController();
  final _otpController = TextEditingController();
  final _usernameController = TextEditingController();

  final _telegramAuthCubit = di<TelegramAuthCubit>();

  @override
  void dispose() {
    _phoneController.dispose();
    _chatController.dispose();
    _otpController.dispose();
    _telegramAuthCubit.close();
    super.dispose();
  }

  final int chatId = 9007199254740991;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _telegramAuthCubit,
      child: BlocConsumer<TelegramAuthCubit, BaseState<TelegramEntity>>(
        listener: (context, state) {
          if (state.status == StateStatus.success && state.isOtpConfirmed) {
            context.router.replace(TelegramAuthStepRoute());
          } else if (state.status == StateStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage ?? 'Произошла ошибка')),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(AppSizes.paddingHorizontal),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(
                    AppSizes.borderRadiusLarge,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.formBorder.withValues(alpha: 0.3),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.clear),
                          ),
                        ),
                        const Text('Вход', style: FontStyles.formFontSize),
                        const SizedBox(height: AppSizes.paddingBottom),

                        AuthInputTextfield(
                          hintText: "Номер телефона Telegram",
                          controller: _phoneController,
                          obscureText: false,
                          validator:
                              (value) =>
                                  value == null || value.isEmpty
                                      ? "Введите номер телефона"
                                      : null,
                        ),
                        const SizedBox(height: AppSizes.paddingTextfildHeight),

                        Row(
                          children: [
                            Expanded(
                              child: AuthInputTextfield(
                                hintText: 'Введите ОТР-код',
                                controller: _otpController,
                                obscureText: false,
                                validator:
                                    (value) =>
                                        value == null || value.isEmpty
                                            ? "Введите код"
                                            : null,
                              ),
                            ),
                            const SizedBox(width: 5),
                            SizedBox(
                              width: 140,
                              child: ElevatedButton(
                                onPressed:
                                    state.status == StateStatus.loading
                                        ? null
                                        : () async {
                                          final phone =
                                              _phoneController.text.trim();

                                          if (phone.isNotEmpty) {
                                            debugPrint(
                                              'Отправка OTP на номер: $phone',
                                            );
                                          }
                                          final username =
                                              _usernameController.text.trim();
                                          if (username.isNotEmpty) {
                                            debugPrint(
                                              'Отправка OTP на номер: $username',
                                            );
                                          }
                                          await _telegramAuthCubit.sendOtp(
                                            params: SendOtpParams(
                                              chatId: chatId,
                                              phoneNumber: phone,
                                            ),
                                          );
                                        },

                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      AppColors.backgroundtextfield,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  child: Text(
                                    'Получить код',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSizes.paddingTextfildHeight),

                        TextButton(
                          onPressed:
                              (state.secondsRemaining ?? 0) == 0
                                  ? () {
                                    if (_phoneController.text.isNotEmpty) {
                                      _telegramAuthCubit.sendOtp(
                                        params: SendOtpParams(
                                          phoneNumber: _phoneController.text,
                                          chatId: chatId,
                                        ),
                                      );
                                    }
                                  }
                                  : null,
                          child: Text(
                            (state.secondsRemaining ?? 0) == 0
                                ? 'Отправить код повторно?'
                                : 'Отправить повторно через 00:${(state.secondsRemaining ?? 0).toString().padLeft(2, '0')} сек.',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),

                        if (state.otpCode != null && state.otpCode!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: Text(
                              'OTP-код: ${state.otpCode}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        const SizedBox(height: AppSizes.paddingTextfildHeight),

                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade100,
                              side: BorderSide(color: AppColors.buttonForm),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await _telegramAuthCubit.confirmOtp(
                                  params: ConfirmOtpParams(
                                    otp: _otpController.text,
                                    phoneNumber: _phoneController.text,
                                    username: _usernameController.text,
                                  ),
                                );
                              }
                            },
                            child: const Text(
                              "Войти",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
