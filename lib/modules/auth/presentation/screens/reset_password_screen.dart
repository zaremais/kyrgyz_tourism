import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/di/service_locator.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/reset_password_result.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/reset_password_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/cubit/reset_password_cubit.dart';

@RoutePage()
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  final _resetPasswordCubit = di<ResetPasswordCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Восстановление пароля'),
        leading: IconButton(
          onPressed: () => context.router.popTop(),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: BlocProvider.value(
        value: _resetPasswordCubit,
        child: BlocConsumer<ResetPasswordCubit, BaseState<ResetPasswordResult>>(
          listener: (context, state) {
            if (state.status == StateStatus.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.model?.message ?? "Успешно")),
              );
              context.router.pop();
            }
            if (state.status == StateStatus.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage ?? 'Ошибка')),
              );
            }
          },
          builder: (context, state) {
            return Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Text(
                        'Введите ваш email для восстановления',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 24),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return "Пожалуйста, введите email";
                        //   }
                        //   if (!RegExp(
                        //     r'^[\w-.]+@([\w-]+\.)+[\w]{2,4}$',
                        //   ).hasMatch(value)) {
                        //     return 'Неверный формат';
                        //   }
                        //   return null;
                        // },
                      ),
                      const SizedBox(height: 50),
                      state.status == StateStatus.loading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _resetPasswordCubit.resetPassword(
                                  params: ResetPasswordParams(
                                    email: _emailController.text,
                                  ),
                                );
                                final email = _emailController.text.trim();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Письмо отправлено на $email',
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Text("Восстановить"),
                          ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
