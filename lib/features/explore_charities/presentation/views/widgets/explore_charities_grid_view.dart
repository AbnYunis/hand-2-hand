import 'package:flutter/material.dart';

import 'explore_charities_item.dart';

class ExploreCharitiesGridView extends StatelessWidget {
  const ExploreCharitiesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: List.generate(
            6,
            (index) => ActivitiesGridViewItem(
                  index: index,
                )),
      ),
    );
  }
}
