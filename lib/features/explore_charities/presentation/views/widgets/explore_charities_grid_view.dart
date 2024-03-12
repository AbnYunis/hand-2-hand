import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hand2hand/features/explore_charities/presentation/maneger/get_charities_cubit.dart';

import 'explore_charities_item.dart';

class ExploreCharitiesGridView extends StatelessWidget {
  const ExploreCharitiesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetCharitiesCubit, GetCharitiesState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetCharitiesSuccess) {
          final charities = state.charities.charities;
          return Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              children: List.generate(
                  charities.length,
                  (index) => ActivitiesGridViewItem(
                        charity: charities[index],
                      )),
            ),
          );
        } else if (state is GetCharitiesFailure) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
