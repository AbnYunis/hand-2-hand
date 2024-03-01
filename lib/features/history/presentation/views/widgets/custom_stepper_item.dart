import 'package:flutter/material.dart';
import 'package:hand2hand/core/utils/media_query.dart';

class CustomStepperItem extends StatelessWidget {
  const CustomStepperItem({super.key});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    return Row(
      children: [
        CircleAvatar(
          radius: w * .04,
          backgroundColor: Colors.green,
        ),
        const SizedBoxApp(
          w: .1,
        ),
        const Column(
          children: [
            Text(
              'Request received',
              style: TextStyle(color: Color(0xff423F3F)),
            ),
            Text(
              'on jun06.2023',
              style: TextStyle(color: Color(0xffB2B2B4)),
            ),
          ],
        )
      ],
    );
  }
}
