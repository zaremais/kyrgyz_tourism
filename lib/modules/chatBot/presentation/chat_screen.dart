import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_app_bar.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_section_button.dart';
import 'package:kyrgyz_tourism/generated/l10n.dart';
import 'package:kyrgyz_tourism/modules/booking_tour/data/api_service/booking_tour_api_service.dart';
import 'package:kyrgyz_tourism/modules/booking_tour/data/repositories/booking_tour_repository.dart';
import 'package:kyrgyz_tourism/modules/booking_tour/domain/usecases/booking_date_use_case.dart';
import 'package:kyrgyz_tourism/modules/booking_tour/presentation/cubit/booking_cubit.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/entities/tour_entity.dart';

@RoutePage()
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key, required this.tour});

  final TourEntity tour;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          height: 70,
          onPressed: () {
            context.router.replace(ChatSupportRoute());
          },
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSectionButton(
                onTap: () {
                  context.router.replace(BookingRoute(tourId: 1));
                },
                text: S.of(context).currentDialogues,
              ),
              SizedBox(height: 14),
              CustomSectionButton(
                onTap: () {
                  // context.router.replace();
                },
                text: S.of(context).completedDialogues,
              ),
              SizedBox(height: 14),
              CustomSectionButton(
                onTap: () {},
                text: S.of(context).startNewDialogue,
              ),
              SizedBox(height: 14),
              CustomSectionButton(
                onTap: () {
                  context.router.replace(ChatSupportRoute());
                },
                text: S.of(context).supportChat,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
