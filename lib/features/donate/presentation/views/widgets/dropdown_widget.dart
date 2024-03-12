import 'package:flutter/material.dart';
import 'package:hand2hand/core/utils/media_query.dart';

String selectedItem = 'food';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({super.key});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  final List<String> items = [
    'food',
    'clothes',
    'money',
    'other',
  ];

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Colors.black),
          borderRadius: BorderRadius.circular(w * .03),
        ),
      ),
      child: DropdownButton<String>(
        borderRadius: BorderRadius.circular(20),
        value: selectedItem,
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              selectedItem = newValue;
            });
          }
        },
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Container(
                padding: EdgeInsets.all(w * .02),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w * .02),
                ),
                child: Text(value)),
          );
        }).toList(),
        style: const TextStyle(
          color: Colors.black, // Text color
        ),
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        iconSize: w * .1,
        elevation: 16,
        isExpanded: true,
        underline: Container(
          height: 0,
        ),
      ),
    );
  }
}
