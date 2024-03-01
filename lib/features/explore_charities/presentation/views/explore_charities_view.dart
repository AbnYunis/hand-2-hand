import 'package:flutter/material.dart';

import 'widgets/explore_charities_body.dart';

class ExploreCharitiesView extends StatelessWidget {
  const ExploreCharitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: ExploreCharitiesBody(),
      ),
    );
  }
}
