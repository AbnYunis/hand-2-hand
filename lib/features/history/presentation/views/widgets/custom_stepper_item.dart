import 'package:flutter/material.dart';
import 'package:hand2hand/core/utils/media_query.dart';

class CustomStepperItem extends StatelessWidget {
  final String text1;
  final String text2;
  final IconData icon;
  final Color color;

  const CustomStepperItem(
      {super.key,
      required this.text1,
      required this.text2,
      required this.icon,
      required this.color});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    return Row(
      children: [
        CircleAvatar(
          radius: w * .04,
          backgroundColor: color,
          child: Icon(icon,color: Colors.white,),
        ),
        const SizedBoxApp(
          w: .1,
        ),
        Column(
          children: [
            Text(
              text1,
              style: const TextStyle(color: Color(0xff423F3F)),
            ),
            Text(
              text2,
              style: const TextStyle(color: Color(0xffB2B2B4)),
            ),
          ],
        )
      ],
    );
  }
}
