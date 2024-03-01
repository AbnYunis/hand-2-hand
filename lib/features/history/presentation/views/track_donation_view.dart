import 'package:flutter/material.dart';
import 'package:hand2hand/features/history/presentation/views/widgets/track_donation_body.dart';

class TrackDonationView extends StatelessWidget {
  const TrackDonationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Track Donation'),
        ),
        body: const TrackDonationBody(),
      ),
    );
  }
}
