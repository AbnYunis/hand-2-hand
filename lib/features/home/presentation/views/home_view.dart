import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hand2hand/core/utils/app_router.dart';
import 'package:hand2hand/core/utils/functions/assets_service.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:hand2hand/core/utils/shared_data.dart';


import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,

          /// The icon of the drawer
          leading: Padding(
            padding: EdgeInsets.only(left: w * .04),
            child: Icon(
              Icons.menu_outlined,
              size: SizeApp(context).width * .11,
            ),
          ),
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
                  onTap: ()=> GoRouter.of(context).push(AppRouter.profile),
                  child: CircleAvatar(
                    radius: w * .05,
                    backgroundImage:  NetworkImage(SharedData.getUserImage()!),
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
    );
  }
}
