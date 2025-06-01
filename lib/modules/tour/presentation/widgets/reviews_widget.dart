import 'package:flutter/material.dart';

class ReviewsWidget extends StatelessWidget {
  final String name;
  final String text;
  const ReviewsWidget({super.key, required this.name, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          Center(
            child: Text(
              name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return Image.asset(
                'assets/images/star.png',
                width: 30,
                height: 30,
              );
            }),
          ),

          SizedBox(height: 6),
          Text(text),
        ],
      ),
    );
  }
}
