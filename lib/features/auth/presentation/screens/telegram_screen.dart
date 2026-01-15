import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_sizes.dart';
import 'package:kyrgyz_tourism/core/config/themes/theme.dart';
import 'package:kyrgyz_tourism/core/constants/validator.dart';
import 'package:kyrgyz_tourism/core/di/service_locator.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/features/auth/domain/entities/telegram_confirm_entity.dart';
import 'package:kyrgyz_tourism/features/auth/domain/entities/telegram_otp_entity.dart';
import 'package:kyrgyz_tourism/features/auth/domain/usecases/telegram_confirm_use_case.dart';
import 'package:kyrgyz_tourism/features/auth/domain/usecases/register_otp_use_case.dart';
import 'package:kyrgyz_tourism/features/auth/presentation/cubit/telegram_otp_cubit.dart';
import 'package:kyrgyz_tourism/features/auth/presentation/cubit/telegram_confirm_cubit.dart';
import 'package:kyrgyz_tourism/features/auth/presentation/widgets/auth_input_textfield.dart';

@RoutePage()
class TelegramScreen extends StatefulWidget {
  const TelegramScreen({super.key});

  @override
  State<TelegramScreen> createState() => _TelegramScreenState();
}

class _TelegramScreenState extends State<TelegramScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  final _telegramConfirmCubit = di<TelegramConfirmCubit>();
  final _telegramOtpCubit = di<TelegramOtpCubit>();

  @override
  void dispose() {
    _phoneController.dispose();
    _otpController.dispose();
    _telegramConfirmCubit.close();
    _telegramOtpCubit.close();
    super.dispose();
  }

  final int chatId = 9007199254740991;

  @override
  Widget build(BuildContext context) {
    final darkTheme = Theme.of(context).brightness == Brightness.dark;
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _telegramConfirmCubit),
        BlocProvider.value(value: _telegramOtpCubit),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<TelegramConfirmCubit, BaseState<TelegramConfirmEntity>>(
            listener: (context, state) {
              if (state.status == StateStatus.success) {
                context.router.replace(const TelegramChatBotRoute());
              } else if (state.status == StateStatus.failure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.errorMessage ?? 'Произошла ошибка подтверждения',
                    ),
                  ),
                );
              }
            },
          ),
          BlocListener<TelegramOtpCubit, BaseState<TelegramOtpEntity>>(
            listener: (context, state) {
              if (state.status == StateStatus.failure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.errorMessage ?? 'Ошибка при отправке OTP',
                    ),
                  ),
                );
              }
            },
          ),
        ],
        child: BlocBuilder<TelegramOtpCubit, BaseState<TelegramOtpEntity>>(
          builder: (otpContext, otpState) {
            return BlocBuilder<
              TelegramConfirmCubit,
              BaseState<TelegramConfirmEntity>
            >(
              builder: (confirmContext, confirmState) {
                return Scaffold(
                  backgroundColor: darkTheme ? Colors.black : Colors.white,
                  body: Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.all(AppSizes.paddingHorizontal),
                      decoration: BoxDecoration(
                        color: darkTheme ? Colors.black : Colors.white,
                        borderRadius: BorderRadius.circular(
                          AppSizes.borderRadiusLarge,
                        ),
                        border: Border.all(color: Colors.white),
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
                              const Text(
                                'Вход',
                                style: FontStyles.formFontSize,
                              ),
                              const SizedBox(height: AppSizes.paddingBottom),

                              AuthInputTextfield(
                                hintText: "Номер телефона Telegram",
                                controller: _phoneController,
                                obscureText: false,
                                keyboardType: TextInputType.phone,
                                textInputAction: TextInputAction.next,
                                validator: validatePhone,
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    final formatted = formatPhoneNumber(value);
                                    if (formatted != value) {
                                      _phoneController.value = TextEditingValue(
                                        text: formatted,
                                        selection: TextSelection.collapsed(
                                          offset: formatted.length,
                                        ),
                                      );
                                    }
                                  }
                                },
                              ),
                              const SizedBox(
                                height: AppSizes.paddingTextfildHeight,
                              ),

                              Row(
                                children: [
                                  Expanded(
                                    child: AuthInputTextfield(
                                      hintText: 'Введите OTP-код',
                                      controller: _otpController,
                                      obscureText: false,
                                      keyboardType: TextInputType.number,

                                      textInputAction: TextInputAction.done,
                                      validator: validateOtp,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  SizedBox(
                                    width: 130,
                                    child: ElevatedButton(
                                      onPressed:
                                          otpState.status == StateStatus.loading
                                              ? null
                                              : () async {
                                                final phone =
                                                    _phoneController.text
                                                        .trim();
                                                if (phone.isEmpty) {
                                                  ScaffoldMessenger.of(
                                                    context,
                                                  ).showSnackBar(
                                                    const SnackBar(
                                                      content: Text(
                                                        'Введите номер телефона',
                                                      ),
                                                      backgroundColor:
                                                          Colors.orange,
                                                    ),
                                                  );
                                                  return;
                                                }
                                                await _telegramOtpCubit.sendOtp(
                                                  params: RegisterOtpParams(
                                                    chatId: chatId,
                                                    phoneNumber:
                                                        formatPhoneNumber(
                                                          phone,
                                                        ),
                                                  ),
                                                );
                                              },
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.green,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 8,
                                        ),
                                        child:
                                            otpState.status ==
                                                    StateStatus.loading
                                                ? const SizedBox(
                                                  width: 16,
                                                  height: 16,
                                                  child: CircularProgressIndicator(
                                                    strokeWidth: 2,
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                          Color
                                                        >(Colors.white),
                                                  ),
                                                )
                                                : const Text(
                                                  'Получить код',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: AppSizes.paddingTextfildHeight,
                              ),

                              TextButton(
                                onPressed:
                                    (otpState.secondsRemaining ?? 0) == 0
                                        ? () {
                                          final phone =
                                              _phoneController.text.trim();
                                          if (phone.isEmpty) {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  'Введите номер телефона',
                                                ),
                                                backgroundColor: Colors.orange,
                                              ),
                                            );
                                            return;
                                          }
                                          _telegramOtpCubit.sendOtp(
                                            params: RegisterOtpParams(
                                              phoneNumber: formatPhoneNumber(
                                                phone,
                                              ),
                                              chatId: chatId,
                                            ),
                                          );
                                        }
                                        : null,
                                child: Text(
                                  (otpState.secondsRemaining ?? 0) == 0
                                      ? 'Отправить код повторно'
                                      : 'Отправить повторно через 00:${(otpState.secondsRemaining ?? 0).toString().padLeft(2, '0')}',
                                  style: TextStyle(
                                    color:
                                        (otpState.secondsRemaining ?? 0) == 0
                                            ? Colors.blue
                                            : Colors.grey,
                                  ),
                                ),
                              ),

                              if (otpState.model?.otp != null &&
                                  otpState.model!.otp!.isNotEmpty)
                                Container(
                                  margin: const EdgeInsets.only(top: 12.0),
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.green.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Colors.green.withValues(
                                        alpha: 0.3,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.check_circle,
                                        color: Colors.green,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          'OTP-код: ${otpState.model!.otp}',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              const SizedBox(
                                height: AppSizes.paddingTextfildHeight,
                              ),

                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    side: BorderSide(
                                      color: AppColors.buttonForm,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _telegramConfirmCubit.confirmOtp(
                                        params: ConfirmOtpParams(
                                          otp: _otpController.text.trim(),
                                          phoneNumber:
                                              _phoneController.text.trim(),
                                        ),
                                      );
                                    }
                                  },
                                  child:
                                      confirmState.status == StateStatus.loading
                                          ? const SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                    Colors.black,
                                                  ),
                                            ),
                                          )
                                          : Text(
                                            "Войти",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  darkTheme
                                                      ? Colors.white
                                                      : Colors.black,
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
            );
          },
        ),
      ),
    );
  }
}
