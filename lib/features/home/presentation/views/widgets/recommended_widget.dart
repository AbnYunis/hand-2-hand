import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hand2hand/core/utils/app_router.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'recommended_second_section.dart';

import 'recommended_first_section.dart';

class RecommendedWidget extends StatelessWidget {
  final int itemNumber;

  const RecommendedWidget(this.itemNumber, {super.key});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    final h = SizeApp(context).height;
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.campaign);
      },
      child: Container(
        width: w * .7,
        padding: EdgeInsets.all(w * .02),
        child: Stack(
          children: [
            /// The background container
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffF5F5F5),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(w * .04),
                    topRight: Radius.circular(w * .04)),
              ),
              width: w * .7,
              height: h * .4,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// The first section in the recommendation widget
                RecommendedFirstSection(),

                /// The second section in the recommendation widget

                RecommendedSecondSection(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
