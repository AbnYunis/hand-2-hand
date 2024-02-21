import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hand2hand/constants.dart';
import 'package:hand2hand/core/utils/app_router.dart';
import '../../../../../core/widgets/custom_rectangle_button.dart';
import '../../../../../core/widgets/custom_auth_text_field.dart';
import '../../../../../core/utils/media_query.dart';
import 'clip_part.dart';
import 'right_part.dart';
import 'sign_up_in.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ClipPart(),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeApp(context).width * 0.05),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBoxApp(
                  h: 0.165,
                ),
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                      fontSize: SizeApp(context).width * 0.1,
                      color: mainColor1,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBoxApp(
                  h: 0.035,
                ),
                const CustomAuthTextField(
                  text: 'Email address/phone number',
                ),
                const SizedBoxApp(
                  h: 0.035,
                ),
                const CustomAuthTextField(
                  text: 'password',
                ),
                const SizedBoxApp(
                  h: 0.01,
                ),
                const RightPart(),
                const SizedBoxApp(
                  h: 0.048,
                ),
                 CustomRectangleButton(
                  text: 'Log in',
                  press: () {
                    GoRouter.of(context).go(AppRouter.home);
                  },
                ),
                const SizedBoxApp(
                  h: 0.02,
                ),
                const SignUpOrIn(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
