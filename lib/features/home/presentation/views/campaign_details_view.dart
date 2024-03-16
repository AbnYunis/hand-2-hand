import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:hand2hand/core/utils/service_locator.dart';
import 'package:hand2hand/features/home/data/repositories/home_repo_implementation.dart';
import 'package:hand2hand/features/home/presentation/manager/fetch_posts_cubit.dart';
import 'package:hand2hand/features/home/presentation/views/widgets/campaig_details_body.dart';

class CampaignDetailsView extends StatelessWidget {
  const CampaignDetailsView({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    return BlocProvider(
      create: (context) =>
          FetchPostsCubit(sl<HomeRepoImplementation>())..fetchOnePosts(id),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text("Campaign Detail",
                style: TextStyle(
                  fontSize: w * .05,
                  fontWeight: FontWeight.w700,
                )),
          ),
          body: CampaignDetailsBody(id:id ,),
        ),
      ),
    );
  }
}
