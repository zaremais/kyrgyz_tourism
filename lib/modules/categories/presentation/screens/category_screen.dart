import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_app_bar.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_section_button.dart';

@RoutePage()
class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(height: 40, showImage: false, onPressed: () {}),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 54),
              CustomSectionButton(text: 'О компании', onTap: () {}),
              SizedBox(height: 14),
              CustomSectionButton(
                text: 'Туры',
                onTap: () {
                  context.router.push(ToursRoute());
                },
              ),
              SizedBox(height: 14),
              CustomSectionButton(text: 'Избранные туры', onTap: () {}),
              SizedBox(height: 14),
              CustomSectionButton(text: 'Контакты', onTap: () {}),
              SizedBox(height: 14),
              CustomSectionButton(text: 'Гиды', onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
