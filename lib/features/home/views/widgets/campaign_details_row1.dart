import 'package:flutter/material.dart';

import '../../../../core/utils/media_query.dart';

class CampaignDetailsRow1 extends StatelessWidget {
  const CampaignDetailsRow1({super.key});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    final h = SizeApp(context).height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Organized By Megan',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: w * .043,
          ),
        ),
        Container(
          width: w * .15,
          height: h * .035,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(w * .2),
              color: const Color(0xfff6e7ea)),
          child: Center(
            child: Text(
              "Follow",
              style: TextStyle(
                  fontSize: w * .035,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xffDB6575)),
            ),
          ),
        )
      ],
    );
  }
}
