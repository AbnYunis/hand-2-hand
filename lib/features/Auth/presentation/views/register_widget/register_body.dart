import 'package:flutter/material.dart';
import 'package:hand2hand/constants.dart';
import 'package:hand2hand/core/widgets/clip_path.dart';
import 'package:hand2hand/core/widgets/custom_app_bar.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'photo_widget.dart';
import 'register_form.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController rePassController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    return Stack(
      children: [
        ClipPath(
          clipper: ClipPathApp(context: context, w: 0.5, h: 0.7, r: 1),
          child: Container(
            width: SizeApp(context).width,
            height: SizeApp(context).height * 1.1,
            color: const Color(0xffC5EDF8),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeApp(context).width * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBoxApp(h: 0.07),
              const CustomAppBar(),
              const SizedBoxApp(h: 0.025),
              Text(
                'Sign up by filling the form below',
                style: TextStyle(
                  fontSize: SizeApp(context).width * 0.045,
                  fontWeight: FontWeight.w800,
                  color: mainColor1,
                ),
              ),
              const SizedBoxApp(h: 0.01),
              const PhotoWidget(),
              RegisterForm(
                  formKey: formKey,
                  nameController: nameController,
                  emailController: emailController,
                  passController: passController,
                  rePassController: rePassController,
                  phoneController: phoneController),
            ],
          ),
        )
      ],
    );
  }
}

