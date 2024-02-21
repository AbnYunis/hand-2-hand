import 'package:flutter/material.dart';

import '../../../../core/utils/media_query.dart';

class CampaignDetailsRow2 extends StatelessWidget {
  const CampaignDetailsRow2({super.key});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    final h = SizeApp(context).height;
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.black,
          radius: w * .05,
          child: const Icon(Icons.account_balance_wallet_outlined),
        ),
        const SizedBoxApp(
          w: .03,
        ),
        Column(
          children: [
            Text(
              'Tues, 14 May, 2023',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: w * .035),
            ),
            const SizedBoxApp(
              h: .008,
            ),
            Text(
              '12pm to 5pm',
              style: TextStyle(
                  color: Colors.black.withOpacity(.5),
                  fontWeight: FontWeight.w700,
                  fontSize: w * .035),
            ),
          ],
        )
      ],
    );
  }
}
