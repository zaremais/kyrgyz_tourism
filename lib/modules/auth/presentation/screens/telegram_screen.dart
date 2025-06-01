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
import 'package:kyrgyz_tourism/modules/auth/domain/entities/user_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/register_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/cubit/auth_cubit.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/widgets/auth_button.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/widgets/auth_input_textfield.dart';

@RoutePage()
class TelegramScreen extends StatefulWidget {
  const TelegramScreen({super.key});

  @override
  State<TelegramScreen> createState() => _TelegramScreenState();
}

class _TelegramScreenState extends State<TelegramScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final _authCubit = di<AuthCubit>();

  @override
  void dispose() {
    _phoneController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteSmoke,
      body: Center(
        child: Container(
          height: AppSizes.paddingFormHeight,
          padding: const EdgeInsets.all(AppSizes.paddingHorizontal),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusLarge),
            boxShadow: [
              BoxShadow(
                color: AppColors.formBorder,
                blurRadius: AppSizes.borderRadiusSmall,
              ),
            ],
          ),
          child: BlocProvider.value(
            value: _authCubit,
            child: BlocBuilder<AuthCubit, BaseState<UserEntity>>(
              builder: (context, state) {
                if (state.status == StateStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state.status == StateStatus.error) {
                  const Text(
                    "Ошибка регистрации",
                    style: TextStyle(color: AppColors.error),
                  );
                }

                if (state.status == StateStatus.success) {
                  context.router.push(HomeRoute());
                }

                return _buildRegistrationForm(context);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRegistrationForm(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Spacer(),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.clear, size: AppSizes.paddingLarge),
            ),
          ],
        ),
        const Center(child: Text('Вход', style: FontStyles.formFontSize)),

        const SizedBox(height: AppSizes.paddingBottom),

        AuthInputTextfield(
          obscureText: false,
          isPassword: false,
          hintText: "Номер телефона Telegram",
          controller: _phoneController,
        ),

        const SizedBox(height: AppSizes.paddingTextfildHeight),

        Row(
          children: [
            Expanded(
              child: AuthInputTextfield(
                isPassword: true,
                hintText: 'Код',
                controller: _codeController,
                obscureText: false,
              ),
            ),
            SizedBox(width: AppSizes.paddingSmall),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.borderRadiusSmall,
                  vertical: AppSizes.paddingMedium,
                ),
                backgroundColor: AppColors.background,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.borderRadiusTen),
                  side: BorderSide(color: AppColors.otpColor),
                ),
              ),

              onPressed: () {
                // _authCubit.sendOtp(_phoneController.text);
              },
              child: Text(
                'ОТР-логин',
                style: TextStyle(color: AppColors.otpColor),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSizes.paddingTextfildHeight),

        Text('Отправить код повторно?', style: FontStyles.subtitleTitle),
        const SizedBox(height: AppSizes.paddingTextfildHeight),
        Center(
          child: AuthButton(
            text: 'Войти',
            onPressed: () {
              context.router.push(HomeRoute());
              if (_phoneController.text.isNotEmpty &&
                  _codeController.text.isNotEmpty) {
                _authCubit.register(
                  RegisterParams(
                    telegramPhone: _phoneController.text,
                    code: _codeController.text,
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Пожалуйста, заполните все поля')),
                );
              }
            },
          ),
        ),
        SizedBox(height: AppSizes.paddingBig),
      ],
    );
  }
}
