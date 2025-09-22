import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/core/widgets/language_switch_widget.dart';
import 'package:kyrgyz_tourism/features/chatBot/data/models/chat_model.dart';

@RoutePage()
class ChatSupportScreen extends StatefulWidget {
  const ChatSupportScreen({super.key});

  @override
  State<ChatSupportScreen> createState() => _ChatSupportScreenState();
}

class _ChatSupportScreenState extends State<ChatSupportScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<ChatModel> messages = [
    ChatModel(
      message: 'Здравствуйте! Чем могу помочь?',
      isFromUser: true,
      timestamp: DateTime.now(),
      suggestedReplies: '',
    ),
  ];

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      messages.add(
        ChatModel(
          message: text,
          isFromUser: true,
          timestamp: DateTime.now(),
          suggestedReplies: '',
        ),
      );
      _controller.clear();
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        messages.add(
          ChatModel(
            message: 'Спасибо за сообщение. Мы скоро ответим.',
            isFromUser: true,
            timestamp: DateTime.now(),
            suggestedReplies: '',
          ),
        );
      });

      _scrollToBottom();
    });

    _scrollToBottom();
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent + 100,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  Widget _buildMessage(ChatModel message) {
    final isUser = message.isFromUser;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment:
              isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isUser)
              Row(
                children: [
                  CircleAvatar(
                    child: Image.network(
                      'https://avatars.mds.yandex.net/i?id=bcd0b1c5fc34b1fc68c4de1038ea965a8aa742f1-5490830-images-thumbs&n=13',
                      fit: BoxFit.cover,
                      width: 40,
                      height: 40,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.person);
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return CircularProgressIndicator(
                          value:
                              loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                        );
                      },
                    ),
                  ),
                ],
              ),

            if (isUser) const SizedBox(height: 8),
            if (isUser)
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.person, color: Colors.white),
              ),
            SizedBox(width: 10),
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isUser ? Colors.grey[300] : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border:
                      isUser
                          ? null
                          : Border.all(color: Colors.green.shade600, width: 1),
                ),
                child: Text(
                  message.message,
                  style: TextStyle(
                    color: isUser ? Colors.black : Colors.black87,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  IconButton(
                    onPressed: () {
                      context.router.push(HomeRoute());
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 12,
                    ),
                  ),
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
                              onPressed: () {
                                context.router.push(HomeRoute());
                              },
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
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            Column(
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

                                const SizedBox(height: 8),

                                const SizedBox(height: 8),

                                Expanded(
                                  child: ListView.builder(
                                    controller: _scrollController,
                                    reverse: false,
                                    padding: const EdgeInsets.all(12),
                                    itemCount: messages.length,
                                    itemBuilder: (context, index) {
                                      return _buildMessage(messages[index]);
                                    },
                                  ),
                                ),

                                Row(children: [
                            
                                  ],
                                ),

                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        'assets/icon/attach.png',
                                        width: 24,
                                      ),
                                    ),

                                    Expanded(
                                      child: TextField(
                                        controller: _controller,
                                        decoration: const InputDecoration(
                                          hintText: 'Введите сообщение...',
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(12),
                                            ),
                                          ),
                                          isDense: true,
                                          contentPadding: EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 10,
                                          ),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: _sendMessage,
                                      icon: Image.asset(
                                        'assets/icon/send.png',
                                        width: 24,
                                      ),
                                    ),
                                  ],
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
