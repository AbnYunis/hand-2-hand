
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:hand2hand/features/history/presentation/manegers/donation_history_cubit/donation_history_cubit.dart';
import 'package:hand2hand/features/history/presentation/views/widgets/history_item.dart';

class HistoryBody extends StatelessWidget {
  const HistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    return Padding(
      padding: EdgeInsets.all(w * .05),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: w * .05),
              child: Text(
                'Donation History',
                style:
                    TextStyle(fontSize: w * .05, fontWeight: FontWeight.bold),
              ),
            ),
            BlocConsumer<DonationHistoryCubit, DonationHistoryState>(
              builder: (context, state) {
                if (state is DonationHistorySuccess) {
                  final donations = state.donationHistoryModel.donations;
                  return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: donations.length,
                      itemBuilder: (context, index) {

                        return HistoryItem(
                          press: true,
                          donationItem: donations[index],
                        );
                      });
                } else if (state is DonationHistoryFailure) {
                  return Column(
                    children: [
                      const SizedBoxApp(
                        h: .3,
                      ),
                      Center(
                        child: Text(state.message),
                      ),
                    ],
                  );
                } else {
                  return const Column(
                    children: [
                      SizedBoxApp(
                        h: .3,
                      ),
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  );
                }
              }, listener: (BuildContext context, DonationHistoryState state) {  },
            ),
          ],
        ),
      ),
    );
  }
}
