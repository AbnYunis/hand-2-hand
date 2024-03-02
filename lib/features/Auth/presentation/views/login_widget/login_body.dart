import 'package:flutter/material.dart';
import 'clip_part.dart';
import 'login_form.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        ClipPart(),
        LoginForm()
      ],
    );
  }
}

