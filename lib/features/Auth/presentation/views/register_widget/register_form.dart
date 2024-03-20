import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:hand2hand/core/utils/service_locator.dart';
import 'package:hand2hand/core/widgets/custom_auth_text_field.dart';
import 'package:hand2hand/core/widgets/custom_rectangle_button.dart';
import 'package:hand2hand/core/widgets/custom_snack_bar.dart';
import 'package:hand2hand/features/Auth/data/repositories/auth_repo_implementation.dart';
import 'package:hand2hand/features/Auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:hand2hand/features/Auth/presentation/manager/auth_cubit/auth_state.dart';

import '../../../../../core/utils/app_router.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.passController,
    required this.rePassController,
    required this.phoneController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passController;
  final TextEditingController rePassController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
          if (state is AuthSuccess) {
    GoRouter.of(context).push(AppRouter.forgetPass,extra: true);
    snackBar(state.authModel.message, context, Colors.white);
    AuthCubit(sl<AuthRepoImplementation>()).close();
          }
          if (state is AuthFailure) {
    snackBar(state.errMessage, context, Colors.red);
          }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBoxApp(h: 0.04),
                  CustomAuthTextField(
                    controller: nameController,
                    text: 'Name',
                    icon: Icons.account_circle_outlined,
                    validate: (p0) {
                      if (p0!.isEmpty) {
                        return "please enter your name";
                      }
                      return null;
                    },
                  ),
                  const SizedBoxApp(h: 0.025),
                  CustomAuthTextField(
                    controller: emailController,
                    text: 'Email ID',
                    icon: Icons.alternate_email_outlined,
                    validate: (p0) {
                      if (p0!.isEmpty) {
                        return "please enter your email";
                      }
                      return null;
                    },
                  ),
                  const SizedBoxApp(h: 0.025),
                  CustomAuthTextField(
                    isPassword: true,
                    controller: passController,
                    text: 'Password',
                    icon: Icons.lock_outline_rounded,
                    validate: (p0) {
                      RegExp regex = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{6,}$');
                      if (p0!.isEmpty) {
                        return "Please enter your password!";
                      } else if (rePassController.text !=
                          passController.text) {
                        return "Password does not match!";
                      } else if (!regex.hasMatch(p0)) {
                        return "Password Must be at least 6 characters and should contain at least one upper case , lower case ,Special character and one digit";
                      }
                      return null;
                    },
                  ),
                  const SizedBoxApp(h: 0.025),
                  CustomAuthTextField(
                    isPassword: true,
                    controller: rePassController,
                    text: 'Confirm Password',
                    icon: Icons.lock_outline_rounded,
                    validate: (p0) {
                      RegExp regex = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{6,}$');
                      if (p0!.isEmpty) {
                        return "Please enter your password!";
                      } else if (rePassController.text !=
                          passController.text) {
                        return "Password does not match!";
                      } else if (!regex.hasMatch(p0)) {
                        return "Password Must be at least 6 characters and should contain at least one upper case , lower case ,Special character and one digit";
                      }
                      return null;
                    },
                  ),
                  const SizedBoxApp(h: 0.025),
                  CustomAuthTextField(
                    controller: phoneController,
                    text: 'Phone number',
                    icon: Icons.call_sharp,
                    validate: (p0) {
                      if (p0!.isEmpty) {
                        return "please enter your phone";
                      }
                      return null;
                    },
                  ),
                  const SizedBoxApp(h: 0.035),
                  state is AuthLoading?const Center(
                    child: CircularProgressIndicator(),
                  ):
              CustomRectangleButton(
                    text: 'Sign up',
                    press: () async {
                      if (formKey.currentState!.validate()) {
                        await BlocProvider.of<AuthCubit>(context).register(
                          email: emailController.text,
                          password: passController.text,
                          userName: nameController.text,
                          phone: phoneController.text,
                          rePassword: rePassController.text,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
