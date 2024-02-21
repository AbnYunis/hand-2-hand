import 'package:flutter/material.dart';
import 'package:hand2hand/constants.dart';
import 'package:hand2hand/features/Auth/presentation/views/forget_pass_widget/forget_pass_body.dart';

class ForgetPassView extends StatelessWidget {
  const ForgetPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: scaffoldColor,
      body: const ForgetPassBody(),
    );
  }
}
