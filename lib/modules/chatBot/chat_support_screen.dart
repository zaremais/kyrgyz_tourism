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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 35,

              decoration: BoxDecoration(
                color: Colors.white,
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
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 580,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          Positioned(
                            child: Column(
                              children: [
                                Container(
                                  width: 343,
                                  height: 50,

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: AppColors.background,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 4,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 5),
                                      Text(
                                        'Салим',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        'Специалист',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 24),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: const CircleAvatar(
                                        radius: 20,
                                        backgroundImage: AssetImage(
                                          'assets/images/ellipse1.png',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Flexible(
                                      child: Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColors.chatMessage,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                        ),
                                        child: const Text(
                                          'Здравствуйте! Как я могу Вам помочь?',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 370),

                                Container(
                                  width: 341,
                                  height: 85,
                                  decoration: BoxDecoration(
                                    color: Color(0xffFAFAFA),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                    ),
                                  ),

                                  child: Positioned(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/icon/attach.png',
                                            width: 24,
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: Container(
                                              width: 253,
                                              height: 37,
                                              decoration: BoxDecoration(),
                                              child: TextField(
                                                controller: _controller,
                                                decoration: InputDecoration(
                                                  hintText:
                                                      'Введите сообщение...',
                                                  contentPadding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 12,
                                                      ),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          5,
                                                        ),
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
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      //       Text(
                      //         'Салим',
                      //         style: TextStyle(
                      //           fontSize: 16,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //       Text(
                      //         'Специалист',
                      //         style: TextStyle(fontSize: 14, color: Colors.grey),
                      //       ),
                      //       const SizedBox(height: 20),
                      //       Row(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           const CircleAvatar(
                      //             radius: 20,
                      //             backgroundImage: AssetImage('assets/salim.jpg'),
                      //           ),
                      //           const SizedBox(width: 10),
                      //           Flexible(
                      //             child: Container(
                      //               padding: const EdgeInsets.all(10),
                      //               decoration: BoxDecoration(
                      //                 border: Border.all(color: AppColors.chatMessage),
                      //                 borderRadius: BorderRadius.circular(15),
                      //               ),
                      //               child: const Text(
                      //                 'Здравствуйте! Как я могу Вам помочь?',
                      //                 style: TextStyle(
                      //                   fontSize: 12,
                      //                   fontWeight: FontWeight.w500,
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //       Spacer(),

                      //       Padding(
                      //         padding: const EdgeInsets.all(0),
                      //         child: Row(
                      //           children: [
                      //             const Icon(Icons.attach_file, color: Colors.grey),
                      //             const SizedBox(width: 10),
                      //             Expanded(
                      //               child: Container(
                      //                 width: 253,
                      //                 height: 37,
                      //                 child: TextField(
                      //                   controller: _controller,
                      //                   decoration: InputDecoration(
                      //                     hintText: 'Введите сообщение...',
                      //                     contentPadding: const EdgeInsets.symmetric(
                      //                       horizontal: 12,
                      //                     ),
                      //                     border: OutlineInputBorder(
                      //                       borderRadius: BorderRadius.circular(5),
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //             const SizedBox(width: 10),
                      //             IconButton(
                      //               onPressed: () {
                      //                 print(_controller.text);
                      //                 _controller.clear();
                      //               },
                      //               icon: const Icon(Icons.send, color: Colors.orange),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
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
