import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/main.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/sign_up_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/signup_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/cubit/sign_up_cubit.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/widgets/auth_input_textfield.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/widgets/signup_button.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  final void Function()? onPressed;
  const SignUpScreen({super.key, this.onPressed});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nicknameController = TextEditingController();
  bool _obscurePassword = true;

  final _signupCubit = di<SignUpCubit>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nicknameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: BlocProvider.value(
            value: _signupCubit,
            child: BlocListener<SignUpCubit, BaseState<SignUpEntity>>(
              listener: (context, state) {
                if (state.status == StateStatus.success) {
                  final email = _emailController.text.trim();
                  final password = _passwordController.text.trim();
                  context.router.replace(
                    RegisterSuccessRoute(email: email, password: password),
                  );
                }

                if (state.status == StateStatus.error) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Ошибка регистрации')));
                }
              },
              child: Center(
                child: Container(
                  width: 450,
                  constraints: const BoxConstraints(maxHeight: 600),
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () => context.router.pop(),
                              icon: const Icon(Icons.close, color: Colors.grey),
                            ),
                          ],
                        ),
                        const Text(
                          'Регистрация',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 40),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              AuthInputTextfield(
                                hintText: 'Введите почту',
                                controller: _emailController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Почта обязательна';
                                  }
                                  // if (!EmailValidator.validate(value.trim())) {
                                  //   return 'Введите корректную почту';
                                  // }
                                  return null;
                                },
                                obscureText: false,
                              ),
                              const SizedBox(height: 15),
                              AuthInputTextfield(
                                hintText: 'Введите логин',
                                controller: _nicknameController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Логин обязателен';
                                  }
                                  if (value.length < 3) {
                                    return 'Минимум 3 символа';
                                  }
                                  return null;
                                },
                                obscureText: false,
                              ),
                              const SizedBox(height: 5),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Придумайте свой логин'),
                              ),
                              const SizedBox(height: 15),
                              AuthInputTextfield(
                                hintText: 'Придумайте пароль',
                                controller: _passwordController,
                                obscureText: _obscurePassword,
                                validator: (value) {
                                  if (value == null || value.length < 8) {
                                    return 'Минимум 8 символов';
                                  }
                                  if (!value.contains(RegExp(r'[A-Z]'))) {
                                    return 'Добавьте заглавную букву';
                                  }
                                  if (!value.contains(RegExp(r'[0-9]'))) {
                                    return 'Добавьте цифру';
                                  }
                                  if (!value.contains(
                                    RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
                                  )) {
                                    return 'Добавьте спецсимвол';
                                  }
                                  return null;
                                },
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    setState(
                                      () =>
                                          _obscurePassword = !_obscurePassword,
                                    );
                                  },
                                ),
                              ),
                              const Text(
                                'Пароль должен быть не менее 8 символов, включать буквы в верхнем и нижнем регистре, содержать цифры и спецсимволы',
                                style: TextStyle(fontSize: 12),
                              ),
                              const SizedBox(height: 30),
                              BlocBuilder<SignUpCubit, BaseState<SignUpEntity>>(
                                builder: (context, state) {
                                  return SignupButton(
                                    isLoading:
                                        state.status == StateStatus.loading,
                                    title: "Далее",
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        _signupCubit.signup(
                                          params: SignUpParams(
                                            email: _emailController.text.trim(),
                                            password:
                                                _passwordController.text.trim(),
                                            nickaname:
                                                _nicknameController.text.trim(),
                                          ),
                                        );
                                      }
                                    },
                                  );
                                },
                              ),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
