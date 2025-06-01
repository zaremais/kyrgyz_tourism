import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_sizes.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/main.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/user_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/cubit/auth_cubit.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/widgets/auth_input_textfield.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _obscurePassword = true;

  final _authCubit = di<AuthCubit>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    if (_formKey.currentState!.validate()) {
      _authCubit.login(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider.value(
        value: _authCubit,
        child: BlocListener<AuthCubit, BaseState<UserEntity>>(
          listener: (context, state) {
            if (state.status == StateStatus.success) {
              context.router.replace(HomeRoute());
            } else if (state.status == StateStatus.error) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Произошла ошибка')));
            }
          },
          child: BlocBuilder<AuthCubit, BaseState<UserEntity>>(
            builder: (context, state) {
              if (state.status == StateStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              }
              return _buildLoginForm(context);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(4),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.black12),
          ),
          constraints: BoxConstraints(maxWidth: 400),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text(
                          'Вход через почту',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      // Spacer(),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  AuthInputTextfield(
                    isPassword: false,
                    obscureText: false,
                    hintText: 'Введите почту или логин',
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Почта обязательна';
                      }
                      final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
                      if (!emailRegex.hasMatch(value)) {
                        return 'Введите корректную почту';
                      }
                      return null;
                    },
                    controller: _emailController,
                  ),
                  const SizedBox(height: 16),

                  AuthInputTextfield(
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() => _obscurePassword = !_obscurePassword);
                      },
                    ),

                    isPassword: true,
                    hintText: 'Введите пароль',
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Пароль обязателен';
                      }
                      if (value.length < 6) {
                        return 'Пароль должени не меньше 6 символов';
                      }
                      return null;
                    },
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                  ),
                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged:
                            (value) =>
                                setState(() => _rememberMe = value ?? false),
                      ),
                      const Text('Запомнить меня'),
                    ],
                  ),

                  // const SizedBox(height: 40),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Забыли пароль?',
                        style: TextStyle(color: Colors.lightBlue),
                      ),
                    ),
                  ),

                  const SizedBox(height: AppSizes.paddingTextfildHeight),
                  BlocBuilder<AuthCubit, BaseState<UserEntity>>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1ED2D9),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                              ),
                              onPressed:
                                  state.status == StateStatus.loading
                                      ? null
                                      : _onLoginPressed,
                              child:
                                  state.status == StateStatus.loading
                                      ? CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                      : Text(
                                        'Войти',
                                        style: TextStyle(color: Colors.white),
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
                                  color: Color(0xFF1ED2D9),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                              ),
                              onPressed: () {
                                context.router.push(TelegramRoute());
                              },
                              child: const Text(
                                'Регистрация',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
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
