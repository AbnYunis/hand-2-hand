import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hand2hand/core/utils/service_locator.dart';
import 'package:hand2hand/features/profile/data/repositories/edit_profile_repo_implement.dart';
import 'package:hand2hand/features/profile/presentation/manager/edit_photo_cubit/edit_photo_cubit.dart';
import 'package:hand2hand/features/profile/presentation/manager/update_profile_cubit/update_profile_cubit.dart';
import 'package:hand2hand/features/profile/presentation/views/widgets/edit_profile_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                UpdateProfileCubit(sl<EditProfileRepoImplement>()),
          ),
          BlocProvider(
            create: (context) => EditPhotoCubit(sl<EditProfileRepoImplement>()),
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Edit profile'),
          ),
          body: const EditProfileBody(),
        ),
      ),
    );
  }
}
