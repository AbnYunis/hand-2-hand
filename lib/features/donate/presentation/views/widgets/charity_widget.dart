import 'package:flutter/material.dart';
import 'package:hand2hand/core/utils/media_query.dart';

class CharityWidget extends StatelessWidget {
  final String name;

  const CharityWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Charity',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBoxApp(h: .01),
        TextField(
          readOnly: true,
          decoration: InputDecoration(
            hintText: name,
            hintStyle: const TextStyle(color: Colors.black),
            contentPadding: EdgeInsets.symmetric(horizontal: w * .03),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(w * .02),
            ),
          ),
        ),
      ],
    );
  }
}
