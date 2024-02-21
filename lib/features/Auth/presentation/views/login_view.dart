import 'package:flutter/material.dart';
import 'package:hand2hand/constants.dart';
import 'package:hand2hand/features/Auth/presentation/views/login_widget/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: scaffoldColor,
      body: const LoginBody(),
    );
  }
}
