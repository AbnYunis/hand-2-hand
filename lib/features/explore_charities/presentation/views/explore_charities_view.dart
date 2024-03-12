import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hand2hand/core/utils/service_locator.dart';
import 'package:hand2hand/features/explore_charities/data/repositories/charities_repo_imolement.dart';
import 'package:hand2hand/features/explore_charities/presentation/maneger/get_charities_cubit.dart';

import 'widgets/explore_charities_body.dart';

class ExploreCharitiesView extends StatelessWidget {
  const ExploreCharitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) =>
            GetCharitiesCubit(sl<CharitiesRepoImplement>())..getAllCharities(),
        child: const Scaffold(
          body: ExploreCharitiesBody(),
        ),
      ),
    );
  }
}
