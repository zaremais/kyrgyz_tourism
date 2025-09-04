import 'package:flutter/material.dart';

class CheckBoxWidget extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  const CheckBoxWidget({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1,
            offset: Offset(1, 1),
            spreadRadius: -1,
          ),
        ],
      ),
      child: CheckboxListTile(
        side: BorderSide(color: Colors.black26),
        checkColor: Colors.grey,
        fillColor: WidgetStatePropertyAll(Colors.white),
        value: value,
        onChanged: (v) => onChanged(v!),
        title: Text(title),

        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
