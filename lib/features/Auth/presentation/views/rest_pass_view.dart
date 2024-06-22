import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hand2hand/constants.dart';
import 'package:hand2hand/core/utils/service_locator.dart';
import 'package:hand2hand/features/Auth/data/repositories/auth_repo_implementation.dart';
import 'package:hand2hand/features/Auth/presentation/manager/reset_pass_cubit/reset_pass_cubit.dart';
import 'package:hand2hand/features/Auth/presentation/views/reset_pass_widget/reset_pass_body.dart';

class ResetPassView extends StatelessWidget {
  const ResetPassView({super.key, required this.parameters});
  final Map<String, dynamic> parameters;

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => ResetPassCubit(sl<AuthRepoImplementation>()),
      child: Scaffold(
        backgroundColor: scaffoldColor,
        body:  ResetPassBody(parameters: parameters),
      ),
    );
  }
}
