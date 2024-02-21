import 'package:flutter/material.dart';

import '../../../../core/utils/media_query.dart';

class RecommendedSecondSection extends StatelessWidget {
  const RecommendedSecondSection({super.key});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    final h = SizeApp(context).height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(w * .04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Educate Every child. Join Our Mission for Quality Education:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: w * .043,
                ),
              ),
              SizedBox(height: h * .01),
              Container(
                height: h * .007,
                width: w * .4,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(w * .01)),
              ),
              SizedBox(height: h * .01),
              Row(
                children: [
                  Text(
                    'Target: ',
                    style: TextStyle(color: Colors.grey, fontSize: w * .04),
                  ),
                  Text(
                    r'150,000 $ ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: w * .05),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
