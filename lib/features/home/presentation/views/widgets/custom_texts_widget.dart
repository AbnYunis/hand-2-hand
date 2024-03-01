import 'package:flutter/material.dart';
import 'package:hand2hand/constants.dart';
import 'package:hand2hand/core/utils/media_query.dart';

class CustomTextsWidget extends StatelessWidget {
  const CustomTextsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    final h = SizeApp(context).height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Hello, ',
              style: TextStyle(fontSize: w * .06, fontWeight: FontWeight.bold),
            ),
            Text(
              'Lenardo',
              style: TextStyle(color: mainColor1, fontSize: w * .06),
            )
          ],
        ),
        SizedBox(height: h * .01),
        Padding(
          padding: EdgeInsets.only(left: w * .04),
          child: const Text('what do you want to donate today?'),
        ),
        SizedBox(height: h * .025),
      ],
    );
  }
}
