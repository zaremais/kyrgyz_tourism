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
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/otp_confirm_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/send_phone_use_case.dart';
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
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _chatController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final _otpFocusNode = FocusNode();

  final _telegramAuthCubit = di<TelegramAuthCubit>();

  @override
  void dispose() {
    _phoneController.dispose();
    _chatController.dispose();
    _otpFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final darkTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: AppSizes.paddingFormHeight,
          padding: const EdgeInsets.all(AppSizes.paddingHorizontal),
          decoration: BoxDecoration(
            color: darkTheme ? Colors.black : Colors.white,
            border: Border.all(color: darkTheme ? Colors.white : Colors.black),
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusLarge),
            boxShadow: [
              BoxShadow(
                color: AppColors.formBorder,
                blurRadius: AppSizes.borderRadiusSmall,
              ),
            ],
          ),
          child: BlocProvider.value(
            value: _telegramAuthCubit,
            child: BlocConsumer<TelegramAuthCubit, BaseState<TelegramEntity>>(
              listener: (context, state) {
                if (state.status == StateStatus.success) {
                  if (state.model?.isVerified == true) {
                    context.router.replace(ChatRoute());
                  } else {
                    FocusScope.of(context).requestFocus(_otpFocusNode);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Код отправлен в Telegram')),
                    );
                  }
                } else if (state.status == StateStatus.error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error ?? 'Произошла ошибка')),
                  );
                }
              },
              builder: (BuildContext context, BaseState<TelegramEntity> state) {
                return _buildRegistrationForm(context, state);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRegistrationForm(
    BuildContext context,
    BaseState<TelegramEntity> state,
  ) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.clear, size: AppSizes.paddingLarge),
              ),
            ],
          ),
          const Center(child: Text('Вход', style: FontStyles.formFontSize)),
          const SizedBox(height: AppSizes.paddingBottom),

          AuthInputTextfield(
            obscureText: false,
            hintText: "Номер телефона Telegram",
            controller: _phoneController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Введите номер телефона";
              }
              return null;
            },
            focusNode: null,
          ),
          const SizedBox(height: AppSizes.paddingTextfildHeight),

          Row(
            children: [
              Expanded(
                child: AuthInputTextfield(
                  hintText: 'Введите ОТР-код',
                  controller: _chatController,
                  focusNode: _otpFocusNode,
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Введите код";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(width: AppSizes.paddingSmall),
              ElevatedButton(
                onPressed:
                    (_telegramAuthCubit.secondsRemaining <= 0)
                        ? () {
                          if (_phoneController.text.isNotEmpty) {
                            _telegramAuthCubit.sendPhoneNumber(
                              _phoneController.text,

                              params: SendOtpParams(
                                chatId: 9007199254740991,
                                phoneNumber: _phoneController.text,
                              ),
                            );
                          }
                        }
                        : null,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Text(
                    'Получить код',
                    style: TextStyle(
                      color: AppColors.textDescription,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.paddingTextfildHeight),

          Expanded(
            child: Row(
              children: [
                Text(
                  'Отправить код повторно?',
                  style: FontStyles.subtitleTitle,
                ),
                const SizedBox(width: 8),

                if (_telegramAuthCubit.secondsRemaining > 0)
                  Text(
                    '00:${state.secondsRemaining!.toString().padLeft(2, '0')} ',
                    style: TextStyle(),
                  ),
              ],
            ),
          ),
          const SizedBox(height: AppSizes.paddingTextfildHeight),

          SizedBox(height: AppSizes.paddingBig),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: AppColors.buttonForm),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () async {
                context.router.replace(ChatRoute());
                if (_formKey.currentState!.validate()) {
                  await _telegramAuthCubit.verifyOtp(
                    _chatController.text,
                    _phoneController.text,
                    params: OtpConfirmParams(
                      otpCode: _otpController.text,
                      phoneNumber: _phoneController.text,
                    ),
                  );
                }
              },
              child: Text(
                "Войти",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
