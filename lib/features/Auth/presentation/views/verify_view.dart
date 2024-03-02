import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hand2hand/constants.dart';
import 'package:hand2hand/core/utils/service_locator.dart';
import 'package:hand2hand/features/Auth/data/repositories/auth_repo_implementation.dart';
import 'package:hand2hand/features/Auth/presentation/manager/confirm_email_otp_cubit/confirm_email_otp_cubit.dart';
import 'package:hand2hand/features/Auth/presentation/manager/generate_otp_cubit/generate_otp_cubit.dart';
import 'verify_widget/verify_body.dart';

class VerifyView extends StatelessWidget {
  const VerifyView({super.key, required this.parameters});
  final Map<String, dynamic> parameters;
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>  ConfirmEmailByOTPCubit(sl<AuthRepoImplementation>()),),
        BlocProvider(create: (context) => GenerateOtpCubit(sl<AuthRepoImplementation>()),),
      ],
      child: Scaffold(
        backgroundColor: scaffoldColor,
        body:  VerifyBody(parameters: parameters),
      ),
    );
  }
}
