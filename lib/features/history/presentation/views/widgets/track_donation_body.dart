import 'package:flutter/material.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:hand2hand/features/history/presentation/views/widgets/custom_stepper_item.dart';
import 'package:hand2hand/features/history/presentation/views/widgets/history_item.dart';

class TrackDonationBody extends StatelessWidget {
  const TrackDonationBody({super.key});

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
          const HistoryItem(),
          const SizedBoxApp(h: .05,),
          const CustomStepperItem(),
          Padding(
            padding: EdgeInsets.only(left: w * .04),
            child: Container(
              height: h * .05,
              color: const Color(0xff3093A8),
              width: 1,
            ),
          ),
          const CustomStepperItem(),
          Padding(
            padding: EdgeInsets.only(left: w * .04),
            child: Container(
              height: h * .05,
              color: const Color(0xff3093A8),
              width: 1,
            ),
          ),
          const CustomStepperItem(),
        ],
      ),
    );
  }
}
