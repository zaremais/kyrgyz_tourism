import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/core/constants/validator.dart';
import 'package:kyrgyz_tourism/core/di/service_locator.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/generated/l10n.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/widgets/auth_input_textfield.dart';
import 'package:kyrgyz_tourism/modules/categories/domain/entities/contact_entity.dart';
import 'package:kyrgyz_tourism/modules/categories/domain/usecases/send_contact_use_case.dart';
import 'package:kyrgyz_tourism/modules/categories/presentation/cubit/contact_cubit.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/widgets/contact_button.dart';

import '../../../../core/config/themes/app_sizes.dart';

import '../../../home/presentation/widgets/painter_line_widget.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormWidgetState();
}

class _ContactFormWidgetState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _commentController = TextEditingController(text: "Свяжитесь со мной");

  final _contactCubit = di<ContactCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _contactCubit,
      child: BlocConsumer<ContactCubit, BaseState<ContactEntity>>(
        listener: (context, state) {
          print('Статус state: ${state.status}');
          if (state.status == StateStatus.success) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Заявка отправлена!")));
            Future.delayed(Duration(milliseconds: 500), () {
              context.router.replace(ContactRoute(contact: state.model!));
            });
          }
          if (state.status == StateStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Ошибка: ${state.errorMessage ?? 'Не удалось отправить заявку'}",
                ),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: AppColors.buttonGuide),
            child: Form(
              key: _formKey,
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
                    controller: _nameController,
                    obscureText: false,
                    validator:
                        (value) =>
                            value == null || value.isEmpty
                                ? 'Введите имя'
                                : null,
                  ),
                  const SizedBox(height: AppSizes.paddingSmall),
                  AuthInputTextfield(
                    obscureText: false,
                    hintText: S.of(context).phonenumber,
                    controller: _phoneController,
                    validator: validatePhone,
                  ),
                  const SizedBox(height: AppSizes.paddingSmall),
                  AuthInputTextfield(
                    obscureText: false,
                    hintText: S.of(context).email,
                    controller: _emailController,
                    validator: validateEmail,
                  ),
                  const SizedBox(height: AppSizes.paddingSmall),
                  AuthInputTextfield(
                    controller: _commentController,
                    obscureText: false,
                  ),
                  // ContactButton(
                  //   text: S.of(context).contactme,
                  //   backgroundColor: Colors.grey.shade300,
                  //   color: AppColors.grey,
                  // ),
                  const SizedBox(height: AppSizes.paddingSmall),
                  const SizedBox(height: 10),
                  CustomPaint(
                    size: Size(double.infinity, 30),
                    painter: DashedLinePainter(),
                  ),
                  const SizedBox(height: 10),

                  state.status == StateStatus.loading
                      ? const CircularProgressIndicator()
                      : ContactButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _contactCubit.sendContact(
                              params: ContactParams(
                                fullName: _nameController.text,
                                phoneNumber: _phoneController.text,
                                email: _emailController.text,
                                comment: _commentController.text,
                              ),
                            );
                          }
                        },
                        text: S.of(context).leaverequest,
                        color: Colors.white,
                        backgroundColor: AppColors.buttonTour,
                      ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
