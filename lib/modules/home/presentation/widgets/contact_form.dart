import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/generated/l10n.dart';
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
          Text(
            S.of(context).needtocontactyou,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          Text(
            S.of(context).leaveyourcontacts,
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
            hintText: S.of(context).surnameandname,
            controller: nameController,
            obscureText: false,
          ),
          const SizedBox(height: AppSizes.paddingSmall),
          AuthInputTextfield(
            obscureText: false,
            hintText: S.of(context).phonenumber,
            controller: phoneController,
          ),
          const SizedBox(height: AppSizes.paddingSmall),
          AuthInputTextfield(
            obscureText: false,
            hintText: S.of(context).email,
            controller: emailController,
          ),
          const SizedBox(height: AppSizes.paddingSmall),
          ContactButton(
            text: S.of(context).contactme,
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
            text: S.of(context).leaverequest,
            color: Colors.white,
            backgroundColor: AppColors.buttonTour,
          ),
        ],
      ),
    );
  }
}
