import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hand2hand/constants.dart';
import 'package:hand2hand/core/utils/app_router.dart';
import 'package:hand2hand/core/utils/functions/load_image.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:hand2hand/core/utils/service_locator.dart';
import 'package:hand2hand/core/utils/shared_data.dart';
import 'package:hand2hand/core/widgets/custom_rectangle_button.dart';
import 'package:hand2hand/core/widgets/custom_rounded_button.dart';
import 'package:hand2hand/core/widgets/custom_snack_bar.dart';
import 'package:hand2hand/features/profile/data/repositories/edit_profile_repo_implement.dart';
import 'package:hand2hand/features/profile/presentation/manager/edit_photo_cubit/edit_photo_cubit.dart';
import 'package:hand2hand/features/profile/presentation/manager/log_out_cubit/log_out_cubit.dart';
import 'package:image_picker/image_picker.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    File? imageFile;
    final w = SizeApp(context).width;
    final h = SizeApp(context).height;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBoxApp(
            h: .1,
          ),
          BlocConsumer<EditPhotoCubit, EditPhotoState>(
            listener: (context, state) {
              if (state is EditPhotoFailure) {
                snackBar(state.message, context, Colors.red);
              }
              if (state is EditPhotoSuccess) {
                SharedData.saveUserImage(
                    userImage: state.updateProfileModel.user.secureUrl!);
              }
            },
            builder: (context, state) {
              return InkWell(
                onTap: () async {
                  final nav = Navigator.of(context);
                  await showDialog(
                          context: context,
                          builder: (context1) {
                            return AlertDialog(
                              title: const Text("Choose image from:"),
                              contentPadding: const EdgeInsets.all(10),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    title: const Text("Camera"),
                                    onTap: () {
                                      pickImage(ImageSource.camera, imageFile)
                                          .then((value) {
                                        imageFile = value;
                                        nav.pop();
                                      });
                                    },
                                    trailing: Icon(
                                      Icons.camera_alt_outlined,
                                      color: mainColor1,
                                    ),
                                  ),
                                  ListTile(
                                    title: const Text("Gallery"),
                                    onTap: () {
                                      pickImage(ImageSource.gallery, imageFile)
                                          .then((value) {
                                        imageFile = value;
                                        nav.pop();
                                      });
                                    },
                                    trailing: Icon(
                                      Icons.image,
                                      color: mainColor1,
                                    ),
                                  )
                                ],
                              ),
                            );
                          })
                      .then((value) => BlocProvider.of<EditPhotoCubit>(context)
                          .editPhoto(imageFile));
                },
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(SharedData.getUserImage()!),
                      radius: w * 0.1,
                    ),
                    CircleAvatar(
                      radius: w * 0.035,
                      backgroundColor: mainColor1,
                      child: (state is EditPhotoLoading)
                          ? const CircularProgressIndicator()
                          : const Icon(
                              Icons.edit_outlined,
                              color: Colors.white,
                            ),
                    ),
                  ],
                ),
              );
            },
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
              }),
        ],
      ),
    );
  }
}
