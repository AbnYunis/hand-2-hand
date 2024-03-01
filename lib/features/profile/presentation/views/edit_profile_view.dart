import 'package:flutter/material.dart';
import 'package:hand2hand/features/profile/presentation/views/widgets/edit_profile_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Profile'),
        ),
        body: const EditProfileBody(),
      ),
    );
  }
}
