import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/modules/categories/domain/entities/contact_entity.dart';

@RoutePage()
class ContactScreen extends StatelessWidget {
  final ContactEntity contact;

  const ContactScreen({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ваша заявка"),
        leading: IconButton(
          onPressed: () {
            context.router.replace(HomeRoute());
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          height: 400,
          child: Card(
            child: Column(
              children: [
                SizedBox(height: 100),
                Text("Фамилия и Имя: ${contact.fullName}"),
                const SizedBox(height: 8),
                Text("Номер телефона: ${contact.phoneNumber}"),
                const SizedBox(height: 8),
                Text("Электронная почта: ${contact.email}"),
                const SizedBox(height: 8),
                Text("Комментарий: ${contact.comment}"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
