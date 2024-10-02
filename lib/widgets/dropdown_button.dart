import 'package:flutter/material.dart';

class DropDownButton extends StatefulWidget {
  final Function(String) onChanged;

  const DropDownButton({super.key, required this.onChanged});

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  String dropdownValue = 'Yearly';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_drop_down),
        elevation: 16,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        borderRadius: BorderRadius.circular(20),
        underline: Container(
          height: 0,
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
          widget.onChanged(dropdownValue); // Call the passed-in callback
        },
        items: <String>['Yearly', 'Monthly', 'Weekly', 'Daily'].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}