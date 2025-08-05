import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_app_bar.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_section_button.dart';
import 'package:kyrgyz_tourism/generated/l10n.dart';

@RoutePage()
class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(height: 70, onPressed: () {}),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 54),
              CustomSectionButton(text: S.of(context).companies, onTap: () {}),
              SizedBox(height: 14),
              CustomSectionButton(
                text: S.of(context).tours,
                onTap: () {
                  context.router.navigate(ToursRoute());
                },
              ),
              SizedBox(height: 14),
              CustomSectionButton(
                text: S.of(context).individualtours,
                onTap: () {
                  context.router.navigate(IndividualToursRoute());
                },
              ),
              SizedBox(height: 14),
              CustomSectionButton(
                text: S.of(context).contacts,
                onTap: () {
                  // context.router.replace(PaymentRoute.page());
                },
              ),
              SizedBox(height: 14),
              CustomSectionButton(
                text: S.of(context).guides,
                onTap: () {
                  context.router.push(GuideRoute());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
