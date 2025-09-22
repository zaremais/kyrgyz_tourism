import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/di/service_locator.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/features/auth/domain/usecases/password_reset_use_case.dart';
import 'package:kyrgyz_tourism/features/auth/presentation/cubit/password_reset_cubit.dart';

@RoutePage()
class PasswordResetScreen extends StatefulWidget {
  const PasswordResetScreen({super.key});

  @override
  State<PasswordResetScreen> createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  late final PasswordResetCubit _resetPasswordCubit;

  @override
  void initState() {
    super.initState();
    _resetPasswordCubit = di<PasswordResetCubit>();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _resetPasswordCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Восстановление пароля'),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: BlocProvider.value(
        value: _resetPasswordCubit,
        child: BlocConsumer<PasswordResetCubit, BaseState<void>>(
          listener: (context, state) {
            if (state.status == StateStatus.success) {
              final email = _emailController.text.trim();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Письмо отправлено на $email')),
              );
              context.router.replace(const PasswordResetConfirmRoute());
            }
            if (state.status == StateStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage ?? 'Ошибка')),
              );
            }
          },
          builder: (context, state) {
            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Text(
                        'Введите ваш email для восстановления',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                        // validator: validateEmail,
                      ),
                      const SizedBox(height: 50),
                      state.status == StateStatus.loading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _resetPasswordCubit.resetPassword(
                                  params: PasswordResetParams(
                                    email: _emailController.text.trim(),
                                  ),
                                );
                              }
                            },
                            child: const Text("Восстановить"),
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
