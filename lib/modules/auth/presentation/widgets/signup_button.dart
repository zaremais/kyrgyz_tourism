import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/sign_up_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/cubit/sign_up_cubit.dart';

class SignupButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  final bool isLoading;
  const SignupButton({
    required this.onPressed,
    this.title = "",
    super.key,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 60,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: BlocBuilder<SignUpCubit, BaseState<SignUpEntity>>(
        builder: (context, state) {
          if (state.status == StateStatus.loading) {
            return _loading(context);
          }
          return _initial(context);
        },
      ),
    );
  }

  Widget _loading(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: const BorderSide(color: AppColors.buttonForm),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      onPressed: isLoading ? null : onPressed,

      child:
          isLoading
              ? const CircularProgressIndicator()
              : Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  // color: Colors.black,
                ),
              ),
    );
  }

  Widget _initial(BuildContext context) {
    final darkTheme = Theme.of(context).brightness == Brightness.dark;
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: const BorderSide(color: AppColors.buttonForm),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      onPressed: onPressed,

      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: darkTheme ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
