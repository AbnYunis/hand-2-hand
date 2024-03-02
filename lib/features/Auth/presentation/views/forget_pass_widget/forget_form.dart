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
import 'package:hand2hand/features/Auth/presentation/manager/generate_otp_cubit/generate_otp_cubit.dart';

class ForgetForm extends StatelessWidget {
  const ForgetForm({
    super.key, required this.isRegister,
  });
  final bool isRegister;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    TextEditingController emailController=TextEditingController();
    return BlocConsumer<GenerateOtpCubit,GenerateOtpState>(
      listener: (context, state) {
        if (state is GenerateOtpSuccess) {
          GoRouter.of(context).push(AppRouter.verify,extra:{
            'email': emailController.text,
            'isRegister': isRegister,
            'userId': state.generateOtp.userId
          } );
          snackBar(state.generateOtp.message, context, Colors.white);
          GenerateOtpCubit(sl<AuthRepoImplementation>()).close();
        }
        if (state is GenerateOtpFailure) {
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
                   text: 'Email ID/Phone number',
                   icon: Icons.alternate_email_outlined,
                   controller: emailController,
                   validate: (p0) {
                     if (p0!.isEmpty) {
                       return "please enter your email";
                     }
                     return null;
                   },
                 ),
                 const SizedBoxApp(h: 0.025),
                 state is GenerateOtpLoading?const Center(
                   child: CircularProgressIndicator(),
                 ):CustomRectangleButton(
                   text: 'Submit',
                   press: () {
                     if(formKey.currentState!.validate()){
                       BlocProvider.of<GenerateOtpCubit>(context).generateOtp(email: emailController.text);
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
