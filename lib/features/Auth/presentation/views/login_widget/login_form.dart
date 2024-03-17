import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hand2hand/constants.dart';
import 'package:hand2hand/core/utils/app_router.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:hand2hand/core/utils/shared_data.dart';
import 'package:hand2hand/core/widgets/custom_auth_text_field.dart';
import 'package:hand2hand/core/widgets/custom_rectangle_button.dart';
import 'package:hand2hand/core/widgets/custom_snack_bar.dart';
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
          SharedData.saveToken(token: state.authModel.token!);
          SharedData.saveUserEmail(userEmail: state.authModel.user.email);
          SharedData.saveUserId(userId: state.authModel.user.userId);
          SharedData.saveUserName(userName: state.authModel.user.userName);
          SharedData.saveUserPhone(userPhone: state.authModel.user.phone);
          SharedData.saveIsLogin(isLogin: state.authModel.user.isLoggedIn);
          if(SharedData.getUserImage() == null){
            SharedData.saveUserImage(userImage: state.authModel.user.secureUrl!);
          }

          GoRouter.of(context).go(AppRouter.home);
          snackBar(state.authModel.message, context, Colors.white);
          //AuthCubit(sl<AuthRepoImplementation>()).close();
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
                    isPassword: true,
                    text: 'password',
                    validate: (p0) {
                      RegExp regex = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{6,}$');
                      if (p0!.isEmpty) {
                        return "Please enter your password!";
                      } else if (!regex.hasMatch(p0)) {
                        return "Password Must be at least 6 characters and should contain at least one upper case , lower case ,Special character and one digit";
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
                            if (formKey.currentState!.validate()) {
                              FocusScope.of(context).unfocus();
                              BlocProvider.of<AuthCubit>(context).login(
                                  email: emailController.text,
                                  password: passController.text);
                            }
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
