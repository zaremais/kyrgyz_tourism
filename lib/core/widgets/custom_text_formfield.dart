import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.label,
    required this.controller,
    this.validator,
    this.onTap,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                labelText: label,
                hintText: hintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: keyboardType,
              validator: validator,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/icon/edit.png',
              color: isDark ? Colors.white : Colors.black,
              width: 20,
            ),
          ),
        ],
      ),
    );
  }
}
