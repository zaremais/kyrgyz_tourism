import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_sizes.dart';
import 'package:kyrgyz_tourism/core/constants/text_password.dart';
import 'package:kyrgyz_tourism/core/constants/validator.dart';
import 'package:kyrgyz_tourism/core/di/service_locator.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/features/auth/domain/entities/sign_up_entity.dart';
import 'package:kyrgyz_tourism/features/auth/domain/usecases/check_nickname_use_case.dart';
import 'package:kyrgyz_tourism/features/auth/domain/usecases/sign_up_use_case.dart';
import 'package:kyrgyz_tourism/features/auth/presentation/cubit/check_nickname_cubit.dart';
import 'package:kyrgyz_tourism/features/auth/presentation/cubit/sign_up_cubit.dart';
import 'package:kyrgyz_tourism/features/auth/presentation/widgets/auth_input_textfield.dart';
import 'package:kyrgyz_tourism/features/auth/presentation/widgets/signup_button.dart';

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
  late final _nicknameCubit = di<CheckNicknameCubit>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nicknameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final darkTheme = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        backgroundColor: darkTheme ? Colors.black : Colors.white,
        body: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: _signupCubit),
            BlocProvider.value(value: _nicknameCubit),
          ],
          child: BlocListener<SignUpCubit, BaseState<SignUpEntity>>(
            listener: (context, state) {
              if (state.status == StateStatus.success) {
                context.router.replace(
                  RegisterSuccessRoute(
                    email: _emailController.text,
                    nickname: _nicknameController.text,
                    password: _passwordController.text,
                  ),
                );
              } else if (state.status == StateStatus.failure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Ошибка регистрации'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              context.router.pop();
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(width: 0),
                          const Text(
                            'Регистрация',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              context.router.pop();
                            },
                            icon: const Icon(Icons.close, color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AuthInputTextfield(
                              hintText: 'Введите почту',
                              controller: _emailController,
                              validator: validateEmail,
                              obscureText: false,
                            ),
                            const SizedBox(height: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AuthInputTextfield(
                                  hintText: 'Введите логин',
                                  controller: _nicknameController,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      _nicknameCubit.checkNickname(
                                        CheckNickNameParams(
                                          nickname:
                                              _nicknameController.text.trim(),
                                        ),
                                      );
                                    }
                                  },

                                  validator: validateNikeName,
                                  obscureText: false,
                                ),
                                const SizedBox(height: 6),
                                BlocBuilder<
                                  CheckNicknameCubit,
                                  BaseState<bool>
                                >(
                                  builder: (context, state) {
                                    if (state.status == StateStatus.loading) {
                                      return const Text(
                                        'Проверка логина...',
                                        style: TextStyle(color: Colors.grey),
                                      );
                                    } else if (state.status ==
                                            StateStatus.success &&
                                        state.model != null) {
                                      final isTaken = state.model!;
                                      return Text(
                                        isTaken
                                            ? 'Этот логин уже занят'
                                            : 'Логин свободен',
                                        style: TextStyle(
                                          color:
                                              state.model == true
                                                  ? Colors.red
                                                  : Colors.green,
                                        ),
                                      );
                                    } else if (state.status ==
                                        StateStatus.failure) {
                                      return Text(
                                        'Ошибка проверки логина',
                                        style: const TextStyle(
                                          color: Colors.red,
                                        ),
                                      );
                                    }
                                    return const SizedBox.shrink();
                                  },
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  'Придумайте свой логин',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: AppSizes.paddingSmallHorizontal),
                            AuthInputTextfield(
                              hintText: 'Придумайте пароль',
                              controller: _passwordController,
                              obscureText: _obscurePassword,
                              validator: validatePassword,
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
                            const SizedBox(height: 10),
                            Text(
                              passwordHint,
                              style: TextStyle(fontSize: AppSizes.paddingSmall),
                            ),
                            const SizedBox(height: 30),
                            BlocBuilder<SignUpCubit, BaseState<SignUpEntity>>(
                              builder: (context, state) {
                                return SignupButton(
                                  isLoading:
                                      state.status == StateStatus.loading,
                                  title: "Далее",
                                  onPressed: () async {
                                    if (!_formKey.currentState!.validate()) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Пожалуйста, заполните форму корректно',
                                          ),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                      return;
                                    }
                                    final nicknameState = _nicknameCubit.state;
                                    if (nicknameState.status ==
                                            StateStatus.success &&
                                        nicknameState.model == true) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            "Этот логин уже занят, выберите другой",
                                          ),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                      return;
                                    }

                                    _signupCubit.signup(
                                      SignUpParams(
                                        email: _emailController.text.trim(),
                                        nickaname:
                                            _nicknameController.text.trim(),
                                        password:
                                            _passwordController.text.trim(),
                                      ),
                                    );
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
    );
  }
}
