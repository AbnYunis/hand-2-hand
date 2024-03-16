import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hand2hand/core/utils/service_locator.dart';
import 'package:hand2hand/features/volunteer/data/repositories/volunteer_repo_implementation.dart';
import 'package:hand2hand/features/volunteer/presentation/manager/volunteer_cubit.dart';
import 'package:hand2hand/features/volunteer/presentation/views/widgets/volunteer_body.dart';

class VolunteerView extends StatelessWidget {
  const VolunteerView({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Volunteer'),
        ),
        body: BlocProvider(
          create: (context) => VolunteerCubit(sl<VolunteerRepoImplementation>()),
          child: VolunteerBody(id: id),
        ),
      ),
    );
  }
}
