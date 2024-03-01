import 'package:flutter/material.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:hand2hand/features/history/presentation/views/widgets/history_item.dart';

class HistoryBody extends StatelessWidget {
  const HistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    final h = SizeApp(context).height;
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
                style: TextStyle(fontSize: w * .05, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) => const HistoryItem(),
            ),
          ],
        ),
      ),
    );
  }
}
