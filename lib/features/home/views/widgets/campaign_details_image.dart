import 'package:flutter/material.dart';

import '../../../../core/utils/functions/assets_service.dart';
import '../../../../core/utils/media_query.dart';
class CampaignDetailsImage extends StatelessWidget {
  const CampaignDetailsImage({super.key});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    final h = SizeApp(context).height;
    return  Container(
      width: double.infinity,
      height: h * .28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(w * .04),
        image: const DecorationImage(
          image: AssetImage(AssetsService.homeImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
