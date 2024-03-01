import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hand2hand/core/utils/app_router.dart';
import 'package:hand2hand/core/utils/functions/assets_service.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:hand2hand/core/widgets/custom_rectangle_button.dart';
import 'package:hand2hand/core/widgets/custom_rounded_button.dart';

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
            backgroundImage: const AssetImage(AssetsService.onBoard1),
          ),
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
            child: const Row(
              children: [
                Icon(
                  Icons.call,
                  color: Color(0xff3093A8),
                ),
                SizedBoxApp(
                  w: .03,
                ),
                Text(
                  '01061516789',
                  style: TextStyle(color: Color(0xff3093A8)),
                )
              ],
            ),
          ),
          const SizedBoxApp(
            h: .02,
          ),
          CustomRectangleButton(
            text: 'EDIT PROFILE',
            press: ()=>GoRouter.of(context).push(AppRouter.editProfile),
          ),
          const SizedBoxApp(
            h: .05,
          ),
          CustomRectangleButton(
              text: 'Logout',
              press: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                    padding: EdgeInsets.all(w * .1),
                    height: h * .3,
                    child: Center(
                      child: Column(
                        children: [
                          const Text(
                            'Logout',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBoxApp(
                            h: .02,
                          ),
                          Divider(
                            height: h * .002,
                          ),
                          const SizedBoxApp(
                            h: .02,
                          ),
                          const Text(
                            'Are you sure you want to log out?',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBoxApp(
                            h: .02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: w * .35,
                                height: h * .05,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      w * .2,
                                    ),
                                    side: const BorderSide(
                                      color: Color(0xff3093A8),
                                    ),
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                        color: Color(0xff3093A8),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              CustomRoundedButton(
                                text: 'Yes, Logout',
                                onPressed: () {},
                                width: w * .35,
                                height: h * .05,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
