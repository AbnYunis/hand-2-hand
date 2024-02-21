import 'package:flutter/material.dart';
import 'package:hand2hand/features/donate/views/widgets/donate_body.dart';

class DonateView extends StatelessWidget {
  const DonateView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Donate'),
          centerTitle: true,
        ),
        body: const DonateBody(),
      ),
    );
  }
}
