import 'package:flutter/material.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:hand2hand/features/history/data/models/history_model.dart';
import 'package:hand2hand/features/history/presentation/views/widgets/custom_stepper_item.dart';
import 'package:hand2hand/features/history/presentation/views/widgets/history_item.dart';

class TrackDonationBody extends StatelessWidget {
  final DonationItem donationItem;
  final String status;

  const TrackDonationBody({
    super.key,
    required this.donationItem,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    final h = SizeApp(context).height;
    return Padding(
      padding: EdgeInsets.all(w * .05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBoxApp(
            h: .03,
          ),
          HistoryItem(
            donationItem: donationItem,
          ),
          const SizedBoxApp(
            h: .02,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              donationItem.desc,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBoxApp(
            h: .05,
          ),
          CustomStepperItem(
            text1: 'Donation Requested',
            text2:
                '${donationItem.createdAt.day}-${donationItem.createdAt.month}-${donationItem.createdAt.year}',
            icon: Icons.done,
            color: Colors.green,
          ),
          Padding(
            padding: EdgeInsets.only(left: w * .04),
            child: Container(
              height: h * .05,
              color: const Color(0xff3093A8),
              width: 1,
            ),
          ),
          CustomStepperItem(
            text1: 'Donation in progress',
            text2:
                '${donationItem.createdAt.day}-${donationItem.createdAt.month}-${donationItem.createdAt.year}',
            icon: Icons.done,
            color: Colors.green,
          ),
          Padding(
            padding: EdgeInsets.only(left: w * .04),
            child: Container(
              height: h * .05,
              color: const Color(0xff3093A8),
              width: 1,
            ),
          ),
          CustomStepperItem(
            text1: 'Donation $status',
            text2:
                '${donationItem.createdAt.day}-${donationItem.createdAt.month}-${donationItem.createdAt.year}',
            icon: status == 'canceled'
                ? Icons.close
                : status == 'pending'
                    ? Icons.more_horiz
                    : Icons.done,
            color: status == 'canceled'
                ? Colors.red
                : status == 'pending'
                    ? Colors.orange
                    : Colors.green,
          ),
        ],
      ),
    );
  }
}
