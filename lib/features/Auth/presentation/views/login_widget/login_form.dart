import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hand2hand/constants.dart';
import 'package:hand2hand/core/utils/app_router.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:hand2hand/core/utils/service_locator.dart';
import 'package:hand2hand/core/utils/shared_data.dart';
import 'package:hand2hand/core/widgets/custom_auth_text_field.dart';
import 'package:hand2hand/core/widgets/custom_rectangle_button.dart';
import 'package:hand2hand/core/widgets/custom_snack_bar.dart';
import 'package:hand2hand/features/Auth/data/repositories/auth_repo_implementation.dart';
import 'package:hand2hand/features/Auth/presentation/manager/auth_cubit/auth_cubit.dart';

import 'right_part.dart';
import 'sign_up_in.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          SharedData.saveToken(token: state.registerModel.token!);
          SharedData.saveUserEmail(userEmail: state.registerModel.user.email);
          SharedData.saveUserId(userId: state.registerModel.user.userId);
          SharedData.saveUserName(userName: state.registerModel.user.userName);
          SharedData.saveUserPhone(userPhone: state.registerModel.user.phone);
          SharedData.saveIsLogin(isLogin: state.registerModel.user.isLoggedIn);
          SharedData.saveUserImage(
              userImage:
                  state.registerModel.user.secureUrl!);

          GoRouter.of(context).go(AppRouter.home);
          snackBar(state.registerModel.message, context, Colors.white);
          AuthCubit(sl<AuthRepoImplementation>()).close();
        }
        if (state is AuthFailure) {
          snackBar(state.errMessage, context, Colors.red);
        }
      },
      builder: (context, state) {
        return Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeApp(context).width * 0.05),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
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
                  CustomAuthTextField(
                    text: 'Email address/phone number',
                    validate: (p0) {
                      if (p0!.isEmpty) {
                        return "please enter your email";
                      }
                      return null;
                    },
                    controller: emailController,
                  ),
                  const SizedBoxApp(
                    h: 0.035,
                  ),
                  CustomAuthTextField(
                    text: 'password',
                    validate: (p0) {
                      if (p0!.isEmpty) {
                        return "please enter your email";
                      }
                      return null;
                    },
                    controller: passController,
                  ),
                  const SizedBoxApp(
                    h: 0.01,
                  ),
                  const RightPart(),
                  const SizedBoxApp(
                    h: 0.048,
                  ),
                  state is AuthLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : CustomRectangleButton(
                          text: 'Log in',
                          press: () {
                            BlocProvider.of<AuthCubit>(context).login(
                                email: emailController.text,
                                password: passController.text);
                          },
                        ),
                  const SizedBoxApp(
                    h: 0.02,
                  ),
                  const SignUpOrIn(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
