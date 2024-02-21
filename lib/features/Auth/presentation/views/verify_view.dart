import 'package:flutter/material.dart';
import 'package:hand2hand/constants.dart';
import 'package:hand2hand/features/Auth/presentation/views/verify_widget/verify_body.dart';

class VerifyView extends StatelessWidget {
  const VerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: scaffoldColor,
      body: const VerifyBody(),
    );
  }
}
