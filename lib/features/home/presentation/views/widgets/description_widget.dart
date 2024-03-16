import 'package:flutter/material.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:readmore/readmore.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({super.key, required this.desc});
  final String desc;
  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    final h = SizeApp(context).height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * .05),
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
          ReadMoreText(
            desc,
            trimLines: 2,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
            moreStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: w * .03, color: Color(0xff72AEF2)
            ),
            lessStyle:TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: w * .03,
              color: Color(0xff72AEF2)
            ) ,
          )
        ],
      ),
    );
  }
}
