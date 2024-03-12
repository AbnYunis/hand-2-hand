import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hand2hand/constants.dart';
import 'package:hand2hand/core/utils/functions/assets_service.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:hand2hand/core/utils/shared_data.dart';
import 'package:hand2hand/core/widgets/custom_rectangle_button.dart';
import 'package:hand2hand/core/widgets/custom_snack_bar.dart';
import 'package:hand2hand/features/profile/presentation/manager/update_profile_cubit/update_profile_cubit.dart';
import 'package:hand2hand/features/profile/presentation/views/widgets/custom_text_field.dart';

final TextEditingController editNameController = TextEditingController();
final TextEditingController editPhoneController = TextEditingController();
final TextEditingController editEmailController = TextEditingController();
final TextEditingController editPasswordController = TextEditingController();

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    editNameController.text = SharedData.getUserName().toString();
    editPhoneController.text = SharedData.getUserPhone().toString();
    editEmailController.text = SharedData.getUserEmail().toString();
    editPasswordController.text = '***********';
    GlobalKey<FormState> formKey = GlobalKey();
    final w = SizeApp(context).width;
    final h = SizeApp(context).height;
    return Center(
      child: Padding(
        padding: EdgeInsets.all(w * .05),
        child: Column(
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
            Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTextField(
                    validate: (val) {
                      if (val!.isEmpty) {
                        return 'You must write your name';
                      } else {
                        return null;
                      }
                    },
                    readOnly: false,
                    hint: 'name',
                    icon: Icons.person,
                    controller: editNameController,
                  ),
                  const SizedBoxApp(
                    h: .035,
                  ),
                  CustomTextField(
                    readOnly: true,
                    hint: 'password',
                    icon: Icons.lock,
                    controller: editPasswordController,
                  ),
                  const SizedBoxApp(
                    h: .035,
                  ),
                  CustomTextField(
                    readOnly: true,
                    hint: 'email',
                    icon: Icons.email_outlined,
                    controller: editEmailController,
                  ),
                  const SizedBoxApp(
                    h: .035,
                  ),
                  CustomTextField(
                    validate: (val) {
                      if (val!.isEmpty) {
                        return 'You must write your phone';
                      } else {
                        return null;
                      }
                    },
                    readOnly: false,
                    hint: 'phone',
                    icon: Icons.phone,
                    controller: editPhoneController,
                  ),
                ],
              ),
            ),
            const SizedBoxApp(
              h: .05,
            ),
            BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
              listener: (context, state) {
                if (state is UpdateProfileFailure) {
                  snackBar(state.message, context, Colors.red);
                } else if (state is UpdateProfileSuccess) {
                  SharedData.saveUserName(
                      userName:
                          state.updateProfileModel.user!.userName);
                  SharedData.saveUserPhone(
                      userPhone:
                          state.updateProfileModel.user!.phone);
                  snackBar(
                      state.updateProfileModel.message!, context, mainColor1);
                }
              },
              builder: (context, state) {
                if (state is UpdateProfileLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return CustomRectangleButton(
                    text: 'Update',
                    press: () => submit(context, formKey),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

submit(BuildContext ctx, formKey) {
  if (!formKey.currentState!.validate()) {
    return;
  }
  if (editPhoneController.text != SharedData.getUserPhone() ||
      editNameController.text != SharedData.getUserName()) {
    FocusScope.of(ctx).unfocus();
    formKey.currentState!.save();
    BlocProvider.of<UpdateProfileCubit>(ctx)
        .updateProfile(editNameController.text, editPhoneController.text);
  } else {
    snackBar('You did not change any data!', ctx, mainColor1);
  }
}
