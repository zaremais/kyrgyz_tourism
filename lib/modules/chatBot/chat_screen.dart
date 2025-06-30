import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_app_bar.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_section_button.dart';

@RoutePage()
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          height: 35,
          onPressed: () {
            context.router.replace(ChatSupportRoute());
          },
          showImage: false,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSectionButton(onTap: () {}, text: 'Текущие диалоги'),
              SizedBox(height: 14),
              CustomSectionButton(onTap: () {}, text: 'Завершенные диалоги'),
              SizedBox(height: 14),
              CustomSectionButton(onTap: () {}, text: 'Начать новый диалог'),
              SizedBox(height: 14),
              CustomSectionButton(
                onTap: () {
                  context.router.replace(ChatSupportRoute());
                },
                text: 'Чат поддержки',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
