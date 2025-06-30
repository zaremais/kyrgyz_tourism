import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/widgets/auth_input_textfield.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/widgets/contact_button.dart';

import '../../../../core/config/themes/app_sizes.dart';

import 'painter_line_widget.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormWidgetState();
}

class _ContactFormWidgetState extends State<ContactForm> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: AppColors.buttonGuide),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Необходимо связаться с Вами?",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const Text(
            "Оставьте свои контакты",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          CustomPaint(
            size: Size(double.infinity, 20),
            painter: DashedLinePainter(),
          ),

          AuthInputTextfield(
            hintText: "Фамилия и Имя",
            controller: nameController,
            obscureText: false,
          ),
          const SizedBox(height: AppSizes.paddingSmall),
          AuthInputTextfield(
            obscureText: false,
            hintText: "Номер телефона",
            controller: phoneController,
          ),
          const SizedBox(height: AppSizes.paddingSmall),
          AuthInputTextfield(
            obscureText: false,
            hintText: "Эл.почта",
            controller: emailController,
          ),
          const SizedBox(height: AppSizes.paddingSmall),
          ContactButton(
            text: "Комментарий: Свяжитесь со мной",
            backgroundColor: Colors.grey.shade300,
            color: AppColors.grey,
          ),
          const SizedBox(height: AppSizes.paddingSmall),
          const SizedBox(height: 10),
          CustomPaint(
            size: Size(double.infinity, 30),
            painter: DashedLinePainter(),
          ),
          ContactButton(
            text: "Оставить заявку",
            color: Colors.white,
            backgroundColor: AppColors.buttonTour,
          ),
        ],
      ),
    );
  }
}
