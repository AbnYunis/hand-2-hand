import 'package:flutter/material.dart';
import 'package:hand2hand/features/home/views/widgets/campaig_details_body.dart';

import '../../../core/utils/media_query.dart';

class CampaignDetailsView extends StatelessWidget {
  const CampaignDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text("Campaign Detail",
              style: TextStyle(
                fontSize: w * .05,
                fontWeight: FontWeight.w700,
              )),
        ),
        body: const CampaignDetailsBody(),
      ),
    );
  }
}
