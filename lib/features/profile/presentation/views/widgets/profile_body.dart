import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hand2hand/core/utils/app_router.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:hand2hand/core/utils/shared_data.dart';
import 'package:hand2hand/core/widgets/custom_rectangle_button.dart';

import 'package:hand2hand/features/profile/presentation/views/widgets/log_out_widget.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    final h = SizeApp(context).height;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBoxApp(
            h: .1,
          ),
          CircleAvatar(
              radius: w * .12,
              backgroundImage: NetworkImage(SharedData.getUserImage()!)),
          const SizedBoxApp(
            h: .05,
          ),
          Container(
            padding: EdgeInsets.only(left: w * .02),
            height: h * .05,
            width: w * .75,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: const BorderSide(color: Color(0xff3093A8)),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.call,
                  color: Color(0xff3093A8),
                ),
                const SizedBoxApp(
                  w: .03,
                ),
                Text(
                  '${SharedData.getUserPhone()}',
                  style: const TextStyle(color: Color(0xff3093A8)),
                )
              ],
            ),
          ),
          const SizedBoxApp(
            h: .02,
          ),
          CustomRectangleButton(
            text: 'EDIT PROFILE',
            press: () => GoRouter.of(context).push(AppRouter.editProfile),
          ),
          const SizedBoxApp(
            h: .05,
          ),
          const LogoutWidget(),
        ],
      ),
    );
  }
}
