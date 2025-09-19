import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/themes/theme.dart';

class TourDetailTile extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subtitle;
  final Color color;
  const TourDetailTile({
    super.key,
    required this.iconPath,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
  
    return ListTile(
      leading: Image.asset(
        iconPath,
      
      ),
      title: Text(title, style: FontStyles.bodyInfo),
      subtitle: Text(subtitle, style: FontStyles.bodyLarge),
    );
  }
}
