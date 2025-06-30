import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/main.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/sign_in_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/sign_in_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/cubit/sign_in_cubit.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/widgets/auth_input_textfield.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/widgets/signin_button.dart';

@RoutePage()
class SignInScreen extends StatefulWidget {
  final void Function()? onPressed;
  const SignInScreen({super.key, this.onPressed});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _obscurePassword = true;

  final _signinCubit = di<SignInCubit>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _signinCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: _signinCubit,
        child: BlocListener<SignInCubit, BaseState<SignInEntity>>(
          listener: (context, state) {
            if (state.status == StateStatus.success) {
              context.router.replace(HomeRoute());
            }

            if (state.status == StateStatus.error) {
              context.router.replace(ProfileRoute());
            }
          },
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                width: 450,
                height: 500,
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.black12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                context.router.replace(AuthRoute());
                              },
                              icon: const Icon(Icons.close, color: Colors.grey),
                            ),
                          ],
                        ),
                        Text(
                          'Вход',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 40),
                        AuthInputTextfield(
                          hintText: 'Введите почту или логин',
                          controller: _emailController,
                          obscureText: false,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Почта обязательна';
                            }
                            // final emailRegex = RegExp(
                            //   r'^[\w\.-]+@[\w\.-]+\.\w+$',
                            // );
                            // if (!emailRegex.hasMatch(value)) {
                            //   return 'Введите корректную почту';
                            // }

                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        AuthInputTextfield(
                          hintText: 'Введите пароль',
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Пароль обязателен';
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
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 14),
                        Row(
                          children: [
                            Checkbox(
                              value: _rememberMe,
                              onChanged:
                                  (value) => setState(
                                    () => _rememberMe = value ?? false,
                                  ),
                            ),
                            const Text('Запомнить меня'),
                          ],
                        ),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Забыли пароль?',
                              style: TextStyle(color: AppColors.forgotText),
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: 170,
                                height: 50,
                                child: SigninButton(
                                  title: 'Войти',

                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _signinCubit.signin(
                                        params: SignInParams(
                                          identifier: _emailController.text,
                                          password: _passwordController.text,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  side: const BorderSide(
                                    color: AppColors.buttonForm,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                ),
                                onPressed: () {
                                  context.router.replace(SignUpRoute());
                                },
                                child: const Text(
                                  'Регистрация',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
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
