import 'package:flutter/material.dart';
import 'package:hand2hand/features/profile/presentation/views/widgets/profile_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Profile'),
        ),
        body: const ProfileBody(),
      ),
    );
  }
}

