import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hand2hand/constants.dart';
import 'package:hand2hand/core/utils/functions/load_image.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:hand2hand/core/utils/shared_data.dart';
import 'package:hand2hand/core/widgets/custom_snack_bar.dart';
import 'package:hand2hand/features/profile/presentation/manager/edit_photo_cubit/edit_photo_cubit.dart';
import 'package:image_picker/image_picker.dart';

class EditImageWidget extends StatelessWidget {
  const EditImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    File? imageFile;
    final w = SizeApp(context).width;
    return BlocConsumer<EditPhotoCubit, EditPhotoState>(
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
                }).then((value) {
              if (imageFile != null) {
                BlocProvider.of<EditPhotoCubit>(context).editPhoto(imageFile);
              }
            });
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
    );
  }
}
