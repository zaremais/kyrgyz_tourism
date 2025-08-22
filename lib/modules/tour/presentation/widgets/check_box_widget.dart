import 'package:flutter/material.dart';

class CheckBoxWidget extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  const CheckBoxWidget({
    super.key,

    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 2,
            offset: Offset(-2, -2),
          ),
        ],
      ),
      child: CheckboxListTile(
        checkColor: Colors.black,
        fillColor: WidgetStatePropertyAll(Colors.white),
        value: value,
        onChanged: (v) => onChanged(v!),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
