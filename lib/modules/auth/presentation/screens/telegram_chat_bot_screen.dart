import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/constants/api_urls.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/screens/telegram_phone_screen.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class TelegramChatBotScreen extends StatelessWidget {
  const TelegramChatBotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (_) => TelegramActivationCubit()..checkTelegramActivation(),
          child: BlocBuilder<TelegramActivationCubit, TelegramActivationState>(
            builder: (context, state) {
              final isSuccess = state.status == TelegramStatus.success;

              return Center(
                child: Column(
                  children: [
                    SizedBox(height: 85),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () => context.router.pop(),
                          icon: const Icon(Icons.close, color: Colors.grey),
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
                    const SizedBox(height: 120),

                    const Text(
                      'Для входа необходимо\nактивировать чат с Telegram-ботом',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 120),
                    Icon(
                      isSuccess ? Icons.arrow_downward_rounded : Icons.close,
                      color: isSuccess ? Colors.teal : Colors.red,
                      size: 50,
                    ),
                    Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () async {
                        // @my_otp_login_bot
                        final url = Uri.parse(ApiUrls.getOtpLink);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(
                            url,
                            mode: LaunchMode.externalApplication,
                          );
                        }
                      },
                      child: const Text('Открыть чат с ботом'),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
