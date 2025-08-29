import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/core/di/init_di.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/sign_in_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/sign_in_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/cubit/sign_in_cubit.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/widgets/auth_input_textfield.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/widgets/signin_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  bool _rememberMe = false;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _loadRememberMeState();
  }

  Future<void> _loadRememberMeState() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _rememberMe = prefs.getBool('remember_me') ?? false;
    });
  }

  Future<void> _saveRememberMeState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('remember_me', _rememberMe);
  }

  final _signinCubit = di<SignInCubit>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _signinCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final darkTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: darkTheme ? Colors.black : Colors.white,
      body: BlocProvider.value(
        value: _signinCubit,
        child: BlocListener<SignInCubit, BaseState<SignInEntity>>(
          listener: (context, state) async {
            if (state.status == StateStatus.success) {
              context.router.replace(HomeRoute());
            }

            if (state.status == StateStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.errorMessage ?? 'Неизвестная ошибка регистрации',
                  ),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: Center(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 500),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Theme.of(context).dividerColor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  context.router.pop();
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                'Вход через почту',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  context.router.push(AuthRoute());
                                },
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 30),
                          AuthInputTextfield(
                            hintText: 'Введите почту или логин',
                            controller: _emailController,
                            obscureText: false,

                            // validator: validateEmail,
                            keyboardType: TextInputType.emailAddress,
                            focusNode: _emailFocusNode,
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(height: 16),
                          AuthInputTextfield(
                            hintText: 'Введите пароль',
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            // validator: validatePassword,
                            focusNode: _passwordFocusNode,
                            textInputAction: TextInputAction.done,

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

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: _rememberMe,
                                    onChanged: (value) {
                                      setState(() {
                                        _rememberMe = value ?? false;
                                      });
                                      _saveRememberMeState();
                                    },
                                  ),
                                  const Text('Запомнить меня'),
                                ],
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: () {
                                  context.router.replace(PasswordResetRoute());
                                },
                                child: const Text(
                                  'Забыли пароль?',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.forgotText,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          BlocBuilder<SignInCubit, BaseState<SignInEntity>>(
                            builder: (context, state) {
                              return Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      width: 170,
                                      height: 50,
                                      child: SigninButton(
                                        title: 'Войти',
                                        isLoading:
                                            state.status == StateStatus.loading,
                                        onPressed:
                                            state.status == StateStatus.loading
                                                ? null
                                                : () {
                                                  final email =
                                                      _emailController.text
                                                          .trim();
                                                  final password =
                                                      _passwordController.text
                                                          .trim();

                                                  if (email.isEmpty ||
                                                      password.isEmpty) {
                                                    ScaffoldMessenger.of(
                                                      context,
                                                    ).showSnackBar(
                                                      const SnackBar(
                                                        content: Text(
                                                          'Пожалуйста, заполните все поля',
                                                        ),
                                                      ),
                                                    );
                                                    return;
                                                  }

                                                  if (_formKey.currentState!
                                                      .validate()) {
                                                    _signinCubit.signin(
                                                      params: SignInParams(
                                                        identifier: email,
                                                        password: password,
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
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        side: const BorderSide(
                                          color: AppColors.buttonForm,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 12,
                                        ),
                                      ),
                                      onPressed:
                                          state.status == StateStatus.loading
                                              ? null
                                              : () {
                                                context.router.replace(
                                                  SignUpRoute(),
                                                );
                                              },
                                      child: Text(
                                        'Регистрация',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          // color:
                                          //     darkTheme
                                          //         ? Colors.white
                                          //         : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          SizedBox(height: 40),
                        ],
                      ),
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
