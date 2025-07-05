import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/modules/reviews/presentation/widgets/reviews_section_list.dart';

@RoutePage()
class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(children: [ReviewsSection()]),
        ),
      ),
    );
  }
}
