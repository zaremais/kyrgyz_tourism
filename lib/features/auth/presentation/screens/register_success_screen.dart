import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/core/di/service_locator.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_button_widget.dart';
import 'package:kyrgyz_tourism/features/profile/domain/entities/profile_entity.dart';
import 'package:kyrgyz_tourism/features/profile/presentation/cubit/profile_cubit.dart';

@RoutePage()
class RegisterSuccessScreen extends StatelessWidget {
  final String email;
  final String nickname;
  final String password;

  RegisterSuccessScreen({
    super.key,
    required this.email,
    required this.nickname,
    required this.password,
  });

  final _profileCubit = di<ProfileCubit>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider.value(
          value: _profileCubit,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
                          onPressed: () {
                            context.router.push(AuthRoute());
                          },
                          icon: Icon(Icons.close, size: 24),
                        ),
                      ],
                    ),
                    Text(
                      'Регистрация',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 150),
                    Image.asset('assets/icon/done.png', width: 60),
                    SizedBox(height: 45),
                    Text(
                      'Вы успешно прошли регистрацию !',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 120),
                    BlocBuilder<ProfileCubit, BaseState<ProfileEntity>>(
                      builder: (context, state) {
                        if (state.status == StateStatus.loading) {
                          return CircularProgressIndicator();
                        }
                        return CustomButtonWidget(
                          text: "Войти в свой профиль",
                          onPressed: () {
                            context.router.replace(ProfileRoute());
                          },
                          backgroundColor: AppColors.buttonForm,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
