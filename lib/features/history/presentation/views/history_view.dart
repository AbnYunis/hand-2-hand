import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hand2hand/core/utils/service_locator.dart';
import 'package:hand2hand/features/history/data/repositories/history_repo_implement.dart';
import 'package:hand2hand/features/history/presentation/manegers/donation_history_cubit/donation_history_cubit.dart';
import 'package:hand2hand/features/history/presentation/views/widgets/history_body.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DonationHistoryCubit(sl<HistoryRepoImplement>())
        ..getDonationHistory(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('History'),
            centerTitle: true,
          ),
          body: const HistoryBody(),
        ),
      ),
    );
  }
}
