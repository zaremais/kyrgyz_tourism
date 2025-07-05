import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/core/widgets/language_switch_widget.dart';

@RoutePage()
class ChatSupportScreen extends StatefulWidget {
  const ChatSupportScreen({super.key});

  @override
  State<ChatSupportScreen> createState() => _ChatSupportScreenState();
}

class _ChatSupportScreenState extends State<ChatSupportScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final darkTheme = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 35,

              decoration: BoxDecoration(
                color: darkTheme ? AppColors.text : AppColors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    spreadRadius: -3,
                    offset: Offset(1, 1),
                  ),
                ],

                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/ellipse2.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Захарова Анна',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 13),
                  Icon(Icons.arrow_forward_ios, color: Colors.black, size: 12),
                  SizedBox(width: 10),
                  Spacer(),
                  LanguageSwitchWidget(),
                ],
              ),
            ),
            SizedBox(height: 40),

            Column(
              children: [
                Container(
                  width: 345,
                  height: 665,
                  decoration: BoxDecoration(
                    color: AppColors.star,
                    border: Border.all(color: Colors.orange),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Text(
                              'Чат поддержки',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.white,
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.minimize, color: Colors.white),
                            SizedBox(width: 10),
                            IconButton(
                              color: Colors.white,
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(Icons.close),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color:
                                    darkTheme
                                        ? AppColors.text
                                        : AppColors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color:
                                        darkTheme
                                            ? AppColors.buttonTour
                                            : AppColors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3,
                                        offset: Offset(0, 1),
                                        spreadRadius: -3,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Салим\nСпециалитст',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 24),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: const CircleAvatar(
                                        radius: 20,
                                        backgroundImage: AssetImage(
                                          'assets/images/ellipse1.png',
                                        ),
                                      ),
                                    ),

                                    Flexible(
                                      child: Container(
                                        margin: EdgeInsets.all(16),
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColors.chatMessage,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                        ),
                                        child: Text(
                                          'Здравствуйте! Как я могу Вам помочь?',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                darkTheme
                                                    ? AppColors.white
                                                    : AppColors.text,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),

                                Container(
                                  width: double.infinity,

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                    ),
                                  ),

                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/icon/attach.png',
                                          width: 24,
                                          color:
                                              darkTheme
                                                  ? AppColors.white
                                                  : AppColors.text,
                                        ),
                                        const SizedBox(width: 20),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                color:
                                                    darkTheme
                                                        ? Colors.white
                                                        : AppColors.text,
                                              ),
                                            ),
                                            child: TextField(
                                              controller: _controller,
                                              decoration: InputDecoration(
                                                hintText:
                                                    'Введите сообщение...',
                                                hintStyle: TextStyle(
                                                  color:
                                                      darkTheme
                                                          ? AppColors.white
                                                          : AppColors.text,
                                                ),
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                    ),
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        IconButton(
                                          onPressed: () {
                                            print(_controller.text);
                                            _controller.clear();
                                          },
                                          icon: Image.asset(
                                            'assets/icon/send.png',
                                            width: 24,
                                            color:
                                                darkTheme
                                                    ? AppColors.white
                                                    : AppColors.text,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
