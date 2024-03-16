import 'package:flutter/material.dart';
import 'package:hand2hand/features/explore_charities/data/models/Charities.dart';

import 'explore_charities_item.dart';

class ExploreCharitiesGridView extends StatelessWidget {
  const ExploreCharitiesGridView({super.key, required this.charities});
  final Charities charities;
  @override
  Widget build(BuildContext context) {
          return Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              children: List.generate(
                  charities.charities.length,
                  (index) => ActivitiesGridViewItem(
                        charity: charities.charities[index],
                      )),
            ),
          );

  }
}
