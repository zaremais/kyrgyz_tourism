import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_auth_textfield.dart';

@RoutePage()
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              width: 450,
              height: 535,
              decoration: BoxDecoration(
                color: darkTheme ? Colors.black87 : Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    spreadRadius: 2,
                    offset: Offset(-1, -1),
                    blurRadius: 1,
                  ),
                ],
                // color: AppColors.backgroundtextfield,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black12),
              ),

              child: Column(
                children: [
                  SizedBox(height: 40),
                  Row(
                    children: [
                      SizedBox(width: 140),
                      Text(
                        'Вход',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 95),
                      IconButton(
                        onPressed: () {
                          context.router.push(SignInRoute());
                        },
                        icon: Icon(Icons.clear, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 80),
                  CustomAuthTextfield(
                    hintText: 'Вход через Телеграм',
                    onTap: () {
                      context.router.push(TelegramRoute());
                    },
                  ),
                  SizedBox(height: 14),
                  CustomAuthTextfield(
                    onTap: () {
                      context.router.push(SignInRoute());
                    },
                    hintText: 'Вход через почту',
                  ),

                  SizedBox(height: 14),
                  CustomAuthTextfield(
                    onTap: () {
                      context.router.push(SignUpRoute());
                    },
                    hintText: 'Пройти регистрацию',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
