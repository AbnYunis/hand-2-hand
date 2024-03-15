import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hand2hand/core/utils/app_router.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:hand2hand/core/utils/service_locator.dart';
import 'package:hand2hand/core/utils/shared_data.dart';
import 'package:hand2hand/core/widgets/custom_rectangle_button.dart';
import 'package:hand2hand/core/widgets/custom_rounded_button.dart';
import 'package:hand2hand/core/widgets/custom_snack_bar.dart';
import 'package:hand2hand/features/profile/data/repositories/edit_profile_repo_implement.dart';
import 'package:hand2hand/features/profile/presentation/manager/log_out_cubit/log_out_cubit.dart';
class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    final h = SizeApp(context).height;
    return CustomRectangleButton(
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
                        InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: Container(
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
                        ),
                        BlocProvider(
                          create: (context) =>
                              LogOutCubit(sl<EditProfileRepoImplement>()),
                          child: BlocConsumer<LogOutCubit, LogOutState>(
                            listener: (context, state) {
                              if (state is LogOutSuccess) {
                                SharedData.removeData('token');
                                SharedData.removeData('userId');
                                SharedData.removeData('userPhone');
                                SharedData.removeData('userName');
                                SharedData.removeData('userEmail');
                                GoRouter.of(context)
                                    .pushReplacement(AppRouter.login);
                                snackBar(
                                    state.message, context, Colors.white);
                              } else if (state is LogOutFailure) {
                                Navigator.of(context).pop();
                                snackBar(
                                    state.message, context, Colors.white);
                              }
                            },
                            builder: (context, state) {
                              if (state is LogOutLoading) {
                                return const Row(
                                  children: [
                                    CircularProgressIndicator(),
                                    SizedBoxApp(
                                      w: .2,
                                    ),
                                  ],
                                );
                              } else {
                                return CustomRoundedButton(
                                  text: 'Yes, Logout',
                                  onPressed: () {
                                    BlocProvider.of<LogOutCubit>(context)
                                        .logOut();
                                  },
                                  width: w * .35,
                                  height: h * .05,
                                );
                              }
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
