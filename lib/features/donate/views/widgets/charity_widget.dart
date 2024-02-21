import 'package:flutter/material.dart';

import '../../../../core/utils/media_query.dart';

class CharityWidget extends StatelessWidget {
  const CharityWidget({super.key});

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
          enabled: false,
          decoration: InputDecoration(
            hintText: 'orman',
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
