import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_app_bar.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_section_button.dart';
import 'package:kyrgyz_tourism/generated/l10n.dart';
import 'package:kyrgyz_tourism/features/categories/domain/entities/contact_entity.dart';

@RoutePage()
class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          height: 70,
          onPressed: () {
            context.router.replace(GuideRoute());
          },
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSectionButton(
                text: S.of(context).companies,
                onTap: () {
                  context.router.navigate(RegisterTourRoute());
                },
              ),
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
                  context.router.replace(
                    ContactRoute(
                      contact: ContactEntity(
                        fullName: '',
                        phoneNumber: '',
                        email: '',
                        comment: '',
                      ),
                    ),
                  );
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
