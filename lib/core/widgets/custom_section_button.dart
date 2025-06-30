import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/themes/theme.dart';

class CustomSectionButton extends StatelessWidget {
  final void Function() onTap;
  final String text;
  const CustomSectionButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 223,
        height: 60,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: FontStyles.bodyText.copyWith(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ),
      ),
    );
  }
}
