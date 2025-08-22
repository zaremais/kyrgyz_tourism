import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_app_bar.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_section_button.dart';
import 'package:kyrgyz_tourism/generated/l10n.dart';

@RoutePage()
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          height: 70,
          onPressed: () {
            context.router.replace(ChatSupportRoute());
          },
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSectionButton(
                onTap: () {},
                text: S.of(context).currentDialogues,
              ),
              SizedBox(height: 14),
              CustomSectionButton(
                onTap: () {
                  // context.router.push(PaymentRoute());
                },
                text: S.of(context).completedDialogues,
              ),
              SizedBox(height: 14),
              CustomSectionButton(
                onTap: () {},
                text: S.of(context).startNewDialogue,
              ),
              SizedBox(height: 14),
              CustomSectionButton(
                onTap: () {
                  context.router.replace(ChatSupportRoute());
                },
                text: S.of(context).supportChat,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
