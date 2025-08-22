import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/core/constants/validator.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_button_widget.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_main_app_bar.dart';
import 'package:kyrgyz_tourism/modules/tour/presentation/widgets/registrer_tour_textform.dart';
import 'package:kyrgyz_tourism/modules/tour/presentation/widgets/text_span_widget.dart';

@RoutePage()
class RegisterTourScreen extends StatefulWidget {
  const RegisterTourScreen({super.key});

  @override
  State<RegisterTourScreen> createState() => _RegisterTourScreenState();
}

class _RegisterTourScreenState extends State<RegisterTourScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _counterController = TextEditingController();
  final _cityController = TextEditingController();

  bool _hasMinors = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomMainAppBar(height: 70, showImage: true),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.95,
            margin: EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      'I.Регистрация на тур',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  TextSpanWidget(hintText: 'ФИО'),
                  SizedBox(height: 8),
                  RegisterTourTextForm(
                    controller: _nameController,
                    label: 'Введите ФИО',
                    validator: validateName,
                  ),

                  SizedBox(height: 20),
                  TextSpanWidget(hintText: 'Электронная почта'),
                  SizedBox(height: 8),
                  RegisterTourTextForm(
                    controller: _emailController,
                    label: 'Электронная почта',
                    validator: validateEmail,
                  ),
                  SizedBox(height: 20),
                  TextSpanWidget(hintText: 'Номер телефона'),
                  SizedBox(height: 8),
                  RegisterTourTextForm(
                    controller: _phoneController,
                    label: 'Введите номер телефона',
                    validator: validatePhone,
                  ),
                  SizedBox(height: 20),
                  TextSpanWidget(hintText: 'Количество участников'),
                  SizedBox(height: 8),
                  RegisterTourTextForm(
                    controller: _counterController,
                    label: 'Укажите количество участников',
                    validator: validateName,
                  ),
                  SizedBox(height: 20),
                  TextSpanWidget(hintText: 'Страна проживания'),
                  SizedBox(height: 8),
                  RegisterTourTextForm(
                    controller: _cityController,
                    label: 'Введите страну поживания',
                    validator: validateName,
                  ),
                  SizedBox(height: 20),
                  TextSpanWidget(
                    hintText: 'Есть ли несовершенолетние участники?',
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => setState(() => _hasMinors = true),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Column(
                                children: [
                                  Checkbox(
                                    checkColor: Colors.black,
                                    side: BorderSide(color: Colors.black),
                                    value: _hasMinors,
                                    onChanged:
                                        (v) =>
                                            setState(() => _hasMinors = true),
                                  ),
                                  const Text('Да'),
                                ],
                              ),

                              GestureDetector(
                                onTap: () => setState(() => _hasMinors = false),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Column(
                                      children: [
                                        Checkbox(
                                          activeColor: Colors.grey.shade200,
                                          checkColor: Colors.black,
                                          side: BorderSide(
                                            color: Colors.black12,
                                          ),
                                          value: !_hasMinors,
                                          onChanged:
                                              (v) => setState(
                                                () => _hasMinors = false,
                                              ),
                                        ),
                                        const Text('Нет'),
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
                  ),

                  Text('Верно заполните все данные'),
                  SizedBox(height: 10),
                  Text(
                    'Наши менеджеры свяжутся с Вами\nи подтвердят вашу бронь на тур',
                  ),
                  SizedBox(height: 30),
                  CustomButtonWidget(
                    text: 'Перейти к оплате',
                    onPressed: () {
                      context.router.push(PaymentRoute());
                    },
                    backgroundColor: AppColors.buttonGuide,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
