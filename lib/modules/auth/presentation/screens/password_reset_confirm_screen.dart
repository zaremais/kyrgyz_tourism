import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';

import 'package:kyrgyz_tourism/core/constants/validator.dart';
import 'package:kyrgyz_tourism/core/di/service_locator.dart';

import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/password_reset_confirm_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/cubit/password_reset_confirm_cubit.dart';

@RoutePage()
class PasswordResetConfirmScreen extends StatefulWidget {
  const PasswordResetConfirmScreen({super.key});

  @override
  State<PasswordResetConfirmScreen> createState() =>
      _PasswordResetConfirmScreenState();
}

class _PasswordResetConfirmScreenState
    extends State<PasswordResetConfirmScreen> {
  final _formKey = GlobalKey<FormState>();
  final _tokenController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  late final PasswordResetConfirmCubit _passwordConfirmCubit;

  @override
  void initState() {
    super.initState();
    _passwordConfirmCubit = di<PasswordResetConfirmCubit>();
  }

  @override
  void dispose() {
    _tokenController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    _passwordConfirmCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Сброс пароля")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocProvider.value(
          value: _passwordConfirmCubit,
          child: BlocConsumer<PasswordResetConfirmCubit, BaseState<void>>(
            listener: (context, state) {
              if (state.status == StateStatus.success) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Пароль успешно сброшен")),
                );
                context.router.replace(SignInRoute());
              } else if (state.status == StateStatus.failure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage ?? 'Ошибка сброса пароля'),
                  ),
                );
              }
            },
            builder: (context, state) {
              return Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _tokenController,
                      decoration: const InputDecoration(labelText: "Токен"),
                      validator: validateToken,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _newPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Новый пароль",
                      ),
                      validator: validateNewPassword,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Подтвердите новый пароль",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста, подтвердите пароль';
                        }
                        if (value != _newPasswordController.text) {
                          return 'Пароли не совпадают';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      onPressed:
                          state.status == StateStatus.loading
                              ? null
                              : () async {
                                if (_formKey.currentState!.validate()) {
                                  await _passwordConfirmCubit.passwordConfirm(
                                    params: PasswordResetConfirmParams(
                                      token: _tokenController.text.trim(),
                                      newPassword:
                                          _newPasswordController.text.trim(),
                                    ),
                                  );
                                }
                              },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 60),
                      ),
                      child:
                          state.status == StateStatus.loading
                              ? const CircularProgressIndicator()
                              : Text(
                                textAlign: TextAlign.center,
                                "Подтвердить сброс пароля",
                                style: TextStyle(color: Colors.black),
                              ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
