import 'package:flutter/material.dart';
import 'package:hand2hand/constants.dart';
import 'package:hand2hand/features/Auth/presentation/views/create_as_widgets/create_as_body.dart';

class CreateAsView extends StatelessWidget {
  const CreateAsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: scaffoldColor,
      body: const CreateAsBody(),
    );
  }
}
