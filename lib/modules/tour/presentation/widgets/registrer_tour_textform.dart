import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/widgets/auth_input_textfield.dart';

class RegisterTourTextForm extends StatelessWidget {
  final TextEditingController controller;
  final Validator? validator;
  final String label;

  const RegisterTourTextForm({
    super.key,
    required this.controller,
    this.validator,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          label: Text(
            label,
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          hintStyle: TextStyle(color: Colors.grey.shade300),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.amber),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
