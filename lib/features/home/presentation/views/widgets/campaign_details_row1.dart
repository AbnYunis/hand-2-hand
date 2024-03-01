import 'package:flutter/material.dart';
import 'package:hand2hand/core/utils/media_query.dart';


class CampaignDetailsRow1 extends StatelessWidget {
  const CampaignDetailsRow1({super.key});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    return Text(
      'Organized By Megan',
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: w * .043,
      ),
    );
  }
}
