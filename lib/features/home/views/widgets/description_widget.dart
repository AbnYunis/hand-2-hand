import 'package:flutter/material.dart';

import '../../../../core/utils/media_query.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    final h = SizeApp(context).height;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: w*.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description:',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: w * .043,
            ),
          ),
          const SizedBoxApp(
            h: .015,
          ),
          Text(
            'Education serves as the bedrock of personal \n'
            'growth and societal advancement. Our mission \n'
            'is crystal clear: to provide every child with\n'
            'access to quality education...',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: w * .03,
            ),
          ),
          const SizedBoxApp(
            h: .015,
          ),
          Container(
            width: w * .25,
            height: h * .035,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xffedf4fa)),
            child: const Center(
              child: Text("Read More+",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff72AEF2))),
            ),
          ),
        ],
      ),
    );
  }
}
