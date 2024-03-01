import 'package:flutter/material.dart';

import 'widgets/congratulation_body.dart';

class CongratulationView extends StatelessWidget {
  const CongratulationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: CongratulationBody(),
      ),
    );
  }
}
