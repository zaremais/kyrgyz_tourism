import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/features/auth/presentation/screens/telegram_phone_screen.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class TelegramChatBotScreen extends StatelessWidget {
  const TelegramChatBotScreen({super.key});

  void _openTelegramBot() async {
    final url = Uri.parse('https://t.me/my_otp_login_bot');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      Text('Ошибка');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (_) => TelegramActivationCubit()..checkTelegramActivation(),
          child: BlocBuilder<TelegramActivationCubit, TelegramActivationState>(
            builder: (context, state) {
              final isSuccess = state.status == TelegramStatus.success;

              return Container(
                margin: EdgeInsets.only(top: 80, right: 24, left: 24),
                height: 600,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: BoxBorder.all(color: AppColors.formBorder),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 30),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                context.router.replace(AuthRoute());
                              },
                              icon: Icon(Icons.close, color: Colors.grey),
                            ),
                          ],
                        ),
                        const Text(
                          'Вход',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 80),

                        Text(
                          'Для входа необходимо\nактивировать чат с Telegram-ботом',
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 80),
                        Icon(
                          isSuccess
                              ? Icons.arrow_downward_rounded
                              : Icons.close,
                          color: isSuccess ? AppColors.buttonForm : Colors.red,
                          size: 50,
                        ),
                        Spacer(),
                        SizedBox(
                          width: 320,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.buttonForm,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: _openTelegramBot,

                            child: Text(
                              'Открыть чат с ботом',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
