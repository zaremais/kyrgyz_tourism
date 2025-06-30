import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_app_bar.dart';

@RoutePage()
class IndividualToursScreen extends StatelessWidget {
  const IndividualToursScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          height: 35,
          onPressed: () {
            context.router.replace(HomeRoute());
          },
          showImage: false,
        ),
        body: Center(
          child: Text('Избранные туры', style: TextStyle(fontSize: 32)),
        ),
      ),
    );
  }
}
