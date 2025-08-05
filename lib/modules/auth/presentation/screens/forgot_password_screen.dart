import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/main.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/reset_password_result.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/reset_password_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/cubit/reset_password_cubit.dart';

@RoutePage()
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _cubit = di<ResetPasswordCubit>();

  @override
  void dispose() {
    _emailController.dispose();
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Восстановление пароля')),
      body: BlocProvider.value(
        value: _cubit,
        child: BlocListener<ResetPasswordCubit, BaseState<ResetPasswordResult>>(
          listener: (context, state) {
            if (state.status == StateStatus.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.model?.message ?? 'Успешно')),
              );
              context.router.pop();
            }

            if (state.status == StateStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage ?? 'Ошибка')),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 50),
                  const Text(
                    'Введите ваш email, мы отправим ссылку на сброс пароля',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 100),
                  TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 54),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _cubit.resetPassword(
                            params: ResetPasswordParams(
                              email: _emailController.text,
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Отправить',
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                    ),
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
