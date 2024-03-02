import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hand2hand/constants.dart';
import 'package:hand2hand/core/utils/service_locator.dart';
import 'package:hand2hand/features/Auth/data/repositories/auth_repo_implementation.dart';
import 'package:hand2hand/features/Auth/presentation/manager/generate_otp_cubit/generate_otp_cubit.dart';
import 'package:hand2hand/features/Auth/presentation/views/forget_pass_widget/forget_pass_body.dart';

class ForgetPassView extends StatelessWidget {
  const ForgetPassView({super.key, required this.isRegister});
  final bool isRegister;

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => GenerateOtpCubit(sl<AuthRepoImplementation>()),
      child: Scaffold(
        backgroundColor: scaffoldColor,
        body:  ForgetPassBody(isRegister: isRegister),
      ),
    );
  }
}
