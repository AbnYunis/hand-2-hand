import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hand2hand/core/utils/service_locator.dart';
import 'package:hand2hand/features/profile/data/repositories/edit_profile_repo_implement.dart';
import 'package:hand2hand/features/profile/presentation/manager/edit_photo_cubit/edit_photo_cubit.dart';
import 'package:hand2hand/features/profile/presentation/views/widgets/profile_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => EditPhotoCubit(sl<EditProfileRepoImplement>()),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Profile'),
          ),
          body: const ProfileBody(),
        ),
      ),
    );
  }
}

