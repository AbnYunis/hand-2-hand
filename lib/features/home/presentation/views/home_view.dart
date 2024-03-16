import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hand2hand/core/utils/app_router.dart';
import 'package:hand2hand/core/utils/functions/assets_service.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:hand2hand/core/utils/service_locator.dart';
import 'package:hand2hand/core/utils/shared_data.dart';
import 'package:hand2hand/core/widgets/app_drawer.dart';
import 'package:hand2hand/features/home/data/repositories/home_repo_implementation.dart';
import 'package:hand2hand/features/home/presentation/manager/fetch_posts_cubit.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;

    return BlocProvider(
      create: (context) =>
          FetchPostsCubit(sl<HomeRepoImplementation>())..fetchPosts(),
      child: SafeArea(
        child: Scaffold(
          drawer: const AppDrawer(),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,


            actions: [
              ///The icon of notification and the image
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset(AssetsService.notification)),
                  SizedBox(
                    width: w * .02,
                  ),
                  GestureDetector(
                    onTap: () => GoRouter.of(context).push(AppRouter.profile),
                    child: CircleAvatar(
                      radius: w * .05,
                      backgroundImage: NetworkImage(SharedData.getUserImage()!),
                    ),
                  ),
                  SizedBox(
                    width: w * .02,
                  ),
                ],
              )
            ],
          ),
          body: const HomeViewBody(),
        ),
      ),
    );
  }
}
