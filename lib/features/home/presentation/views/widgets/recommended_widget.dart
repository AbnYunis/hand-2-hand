import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hand2hand/core/utils/app_router.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:hand2hand/features/home/data/models/posts_model.dart';
import 'recommended_second_section.dart';

import 'recommended_first_section.dart';

class RecommendedWidget extends StatelessWidget {
  final int itemNumber;
  final PostsModel postModel;

  const RecommendedWidget(this.itemNumber,
      {super.key, required this.postModel});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    final h = SizeApp(context).height;
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.campaign, extra: postModel.posts[itemNumber].id);
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// The first section in the recommendation widget
                  RecommendedFirstSection(
                    image: postModel.posts[itemNumber].image.secureUrl,
                  ),

                  /// The second section in the recommendation widget

                  RecommendedSecondSection(
                    posts: postModel,
                    index: itemNumber,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
