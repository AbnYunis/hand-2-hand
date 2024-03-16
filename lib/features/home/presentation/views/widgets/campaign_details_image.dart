import 'package:flutter/material.dart';
import 'package:hand2hand/core/utils/functions/assets_service.dart';
import 'package:hand2hand/core/utils/media_query.dart';


class CampaignDetailsImage extends StatelessWidget {
  const CampaignDetailsImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    final h = SizeApp(context).height;
    return  Container(
      width: double.infinity,
      height: h * .28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(w * .04),
        image:  DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
