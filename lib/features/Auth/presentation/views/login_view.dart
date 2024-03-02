import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hand2hand/constants.dart';
import 'package:hand2hand/core/utils/service_locator.dart';
import 'package:hand2hand/features/Auth/data/repositories/auth_repo_implementation.dart';
import 'package:hand2hand/features/Auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:hand2hand/features/Auth/presentation/views/login_widget/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => AuthCubit(sl<AuthRepoImplementation>()),
      child: Scaffold(
        backgroundColor: scaffoldColor,
        body: const LoginBody(),
      ),
    );
  }
}
