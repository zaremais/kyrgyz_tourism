import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_sizes.dart';

class CustomDrawerTile extends StatelessWidget {
  final String title;

  final void Function()? onTap;
  const CustomDrawerTile({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Center(
        child: Text(title, style: TextStyle(fontSize: AppSizes.logoFontSize)),
      ),
      onTap: onTap,
    );
  }
}
