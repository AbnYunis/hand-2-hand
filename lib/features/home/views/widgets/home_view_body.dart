import 'package:flutter/material.dart';
import 'package:hand2hand/core/utils/media_query.dart';

import 'category_item.dart';
import 'custom_texts_widget.dart';
import 'favourite_categories_row.dart';
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
        const SearchTextField(),
        SizedBox(height: h * .015),
        /// Favourite text
        const FavouriteCategoriesRow(),
        SizedBox(height: h * .01),
        /// The favourite list
        SizedBox(
          height: h * .15,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (context, index) {
              return MyListItem(index + 1); // Add 1 to start index from 1
            },
          ),
        ),
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
              return RecommendedWidget(index + 1); // Add 1 to start index from 1
            },
          ),
        ),
      ],
    );
  }
}
