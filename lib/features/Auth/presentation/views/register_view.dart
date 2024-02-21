import 'package:flutter/material.dart';
import 'package:hand2hand/constants.dart';
import 'register_widget/register_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: scaffoldColor,
      body: const RegisterBody(),
    );
  }
}
