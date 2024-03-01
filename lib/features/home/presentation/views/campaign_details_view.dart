import 'package:flutter/material.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:hand2hand/features/home/presentation/views/widgets/campaig_details_body.dart';

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
