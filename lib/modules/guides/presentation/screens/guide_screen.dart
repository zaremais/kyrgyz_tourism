import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_sizes.dart';
import 'package:kyrgyz_tourism/core/widgets/language_switch_widget.dart';
import 'package:kyrgyz_tourism/modules/guides/presentation/widgets/guide_section.dart';

@RoutePage()
class GuideScreen extends StatefulWidget {
  const GuideScreen({super.key});

  @override
  State<GuideScreen> createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shape: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(5),
        ),
        toolbarHeight: 40,
        backgroundColor: AppColors.background,
        leading: IconButton(
          onPressed: () {
            context.router.push(HomeRoute());
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        actions: [LanguageSwitchWidget()],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [SizedBox(height: AppSizes.paddingLarge), GuideSection()],
        ),
      ),
    );
  }
}
