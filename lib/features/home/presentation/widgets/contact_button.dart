import 'package:flutter/material.dart';

class ContactButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? color;
  const ContactButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 35,

      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          backgroundColor: backgroundColor,
        ),
        child: Text(text, style: TextStyle(fontSize: 16, color: color)),
      ),
    );
  }
}
