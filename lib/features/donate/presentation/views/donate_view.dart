import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hand2hand/core/utils/service_locator.dart';
import 'package:hand2hand/features/donate/data/repositories/make_donation_repo_implement.dart';
import 'package:hand2hand/features/donate/presentation/manegers/make_donation_cubit.dart';
import 'package:hand2hand/features/donate/presentation/views/widgets/donate_body.dart';

class DonateView extends StatelessWidget {
  final Map<String, dynamic> data;

  const DonateView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => MakeDonationCubit(sl<MakeDonationRepoImplement>()),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Donate'),
            centerTitle: true,
          ),
          body: DonateBody(
            charityName: data['charityName'],
            id: data['charityId'],
          ),
        ),
      ),
    );
  }
}
