import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hand2hand/constants.dart';
import 'package:hand2hand/core/utils/app_router.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:hand2hand/core/utils/shared_data.dart';
import 'package:hand2hand/features/profile/presentation/views/widgets/log_out_widget.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    final h = SizeApp(context).height;
    return Drawer(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * .05, vertical: h * .1),
        child: Column(
          children: [
            ListTile(
              onTap: () {
                GoRouter.of(context).push(AppRouter.profile);
                Scaffold.of(context).closeDrawer();
              },
              contentPadding: EdgeInsets.all(w * .02),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: mainColor1, width: 2)),
              trailing: const Icon(Icons.arrow_forward_ios_sharp),
              title: const Text(
                'Profile',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: CircleAvatar(
                  radius: w * .12,
                  backgroundImage: NetworkImage(SharedData.getUserImage()!)),
            ),
            const SizedBoxApp(
              h: .04,
            ),
            ListTile(
              onTap: () {
                GoRouter.of(context).push(AppRouter.history);
                Scaffold.of(context).closeDrawer();
              },
              contentPadding: EdgeInsets.all(w * .02),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: mainColor1, width: 2)),
              trailing: const Icon(Icons.arrow_forward_ios_sharp),
              title: const Text(
                'Donation History',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Icon(
                Icons.history,
                size: w * .07,
              ),
            ),
            const Spacer(),
            const LogoutWidget(),
          ],
        ),
      ),
    );
  }
}
