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
    final darkTheme = Theme.of(context).brightness == Brightness.dark;
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
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 500),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Theme.of(context).dividerColor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
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
                                  context.router.replace(AuthRoute());
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
                          ),
                          SizedBox(height: 16),
                          AuthInputTextfield(
                            hintText: 'Введите пароль',
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            // validator: validatePassword,
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
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _rememberMe = !_rememberMe;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: _rememberMe,
                                      onChanged: (value) {
                                        setState(() {
                                          _rememberMe = value ?? false;
                                        });
                                      },
                                    ),
                                    const Text('Запомнить меня'),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: () {
                                  context.router.replace(ForgotPasswordRoute());
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
                                  child: Text(
                                    'Регистрация',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          darkTheme
                                              ? Colors.white
                                              : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
