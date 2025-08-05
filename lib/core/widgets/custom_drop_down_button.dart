import 'package:flutter/material.dart';

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({super.key});

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  List<String> guiads = ['element1', 'element2', 'element3'];

  String selectedValue = 'element1';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(height: 2, width: 250, color: Colors.grey),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: DropdownButton(
            value: selectedValue,
            items:
                guiads
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
            onChanged: (value) {
              selectedValue = value ?? '';
              setState(() {});
            },
          ),
        ),
      ],
    );
  }
}
