import 'package:flutter/material.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:hand2hand/features/home/data/models/posts_model.dart';


class RecommendedSecondSection extends StatelessWidget {
  const RecommendedSecondSection({super.key, required this.posts, required this.index});
  final PostsModel posts;
  final int index;
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
                posts.posts[index].title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: w * .043,
                ),
              ),
              Text(
                posts.posts[index].desc,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: w * .043,
                ),
              ),
              SizedBox(height: h * .01),
              Container(
                width: w * .4,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(w * .01)),
              ),
              SizedBox(height: h * .01),
              Row(
                children: [
                  Text(
                    posts.posts[index].createdBy.charityName,
                    style: TextStyle(color: Colors.grey, fontSize: w * .04),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
