import 'package:flutter/material.dart';

import '../../../../core/utils/media_query.dart';

class ItemCountWidget extends StatelessWidget {
  const ItemCountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Item counts',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBoxApp(h: .01),
        TextField(
          decoration: InputDecoration(
            hintText: 'counts',
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
