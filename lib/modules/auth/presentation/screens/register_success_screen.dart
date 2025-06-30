import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_button_widget.dart'
    show CustomButtonWidget;
import 'package:kyrgyz_tourism/main.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/sign_in_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/cubit/sign_in_cubit.dart';

@RoutePage()
class RegisterSuccessScreen extends StatelessWidget {
  final String email;
  final String password;
  RegisterSuccessScreen({
    super.key,
    required this.email,
    required this.password,
  });

  final _signinCubit = di<SignInCubit>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 345,
          height: 555,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () => context.router.pop(),
                    icon: Icon(Icons.close, size: 24),
                  ),
                ],
              ),
              Text(
                'Регистрация',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 150),
              Image.asset('assets/icon/done.png', width: 60),
              SizedBox(height: 45),
              Text(
                'Вы успешно прошли регистрацию !',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 120),
              CustomButtonWidget(
                text: "Войти в свой профиль",
                onPressed: () async {
                  _signinCubit.signin(
                    params: SignInParams(identifier: email, password: password),
                  );
                  context.router.replace(ProfileRoute());
                },
                backgroundColor: AppColors.buttonForm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
