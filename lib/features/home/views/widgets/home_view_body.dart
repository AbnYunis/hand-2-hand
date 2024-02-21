import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hand2hand/core/utils/app_router.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:hand2hand/features/home/views/widgets/favourite_widget.dart';

import 'custom_texts_widget.dart';
import 'recommended_widget.dart';
import 'search_text_field.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    final h = SizeApp(context).height;
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: w * .05, vertical: h * .01),
      physics: const BouncingScrollPhysics(),
      children: [
        /// The texts hello
        const CustomTextsWidget(),

        /// search text field
        TextButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.exploreCharities);
            },
            child: Row(
              children: [
                const Text(
                  'See all charities',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBoxApp(
                  w: .05,
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: w * .05,
                  color: Colors.black,
                ),
              ],
            )),
        const SearchTextField(),
        SizedBox(height: h * .015),

        /// The favourite list
        const DonateWidget(),
        SizedBox(height: h * .015),

        /// Recommendation text
        Padding(
          padding: EdgeInsets.only(left: w * .05),
          child: Text(
            'Recommend for you',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: w * .04),
          ),
        ),

        /// The recommendation list items
        SizedBox(
          height: 360,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return RecommendedWidget(
                  index + 1); // Add 1 to start index from 1
            },
          ),
        ),
      ],
    );
  }
}
