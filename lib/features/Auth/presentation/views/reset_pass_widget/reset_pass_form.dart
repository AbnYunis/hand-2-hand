import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hand2hand/core/utils/app_router.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:hand2hand/core/utils/service_locator.dart';
import 'package:hand2hand/core/widgets/custom_auth_text_field.dart';
import 'package:hand2hand/core/widgets/custom_rectangle_button.dart';
import 'package:hand2hand/core/widgets/custom_snack_bar.dart';
import 'package:hand2hand/features/Auth/data/repositories/auth_repo_implementation.dart';
import 'package:hand2hand/features/Auth/presentation/manager/reset_pass_cubit/reset_pass_cubit.dart';

class ResetPassForm extends StatelessWidget {
  const ResetPassForm({
    super.key, required this.parameters,
  });
  final Map<String, dynamic> parameters;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    TextEditingController emailController=TextEditingController();
    return BlocConsumer<ResetPassCubit,ResetPassState>(
      listener: (context, state) {
        if (state is ResetPassSuccess) {
          GoRouter.of(context).go(AppRouter.login,);
          snackBar(state.message, context, Colors.white);
          ResetPassCubit(sl<AuthRepoImplementation>()).close();
        }
        if (state is ResetPassFailure) {
          snackBar(state.message, context, Colors.red);
        }
      },
      builder: (context, state) {
       return Expanded(
         child: SingleChildScrollView(
           child: Form(
             key: formKey,
             child: Column(
               children: [
                 const SizedBoxApp(h: 0.06),
                 CustomAuthTextField(
                   isPassword: true,
                   text: 'Enter New Password',
                   icon: Icons.alternate_email_outlined,
                   controller: emailController,
                   validate: (p0) {
                     RegExp regex = RegExp(
                         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{6,}$');
                     if (p0!.isEmpty) {
                       return "Please enter your password!";
                     }else if (!regex.hasMatch(p0)) {
                       return "Password Must be at least 6 characters and should contain at least one upper case , lower case ,Special character and one digit";
                     }
                     return null;
                   },
                 ),
                 const SizedBoxApp(h: 0.025),
                 state is ResetPassLoading?const Center(
                   child: CircularProgressIndicator(),
                 ):CustomRectangleButton(
                   text: 'Submit',
                   press: () {
                     if(formKey.currentState!.validate()){
                       BlocProvider.of<ResetPassCubit>(context).resetPassOtp(pass: emailController.text, data: parameters);
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
