import 'package:flutter/material.dart';
import 'package:hand2hand/core/utils/media_query.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBoxApp(h: .01),
        TextField(
          minLines: 4,
          maxLines: 10,
          decoration: InputDecoration(
            hintText: 'description',
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
