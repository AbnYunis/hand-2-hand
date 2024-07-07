import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hand2hand/core/utils/app_router.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:hand2hand/features/explore_charities/data/models/Charities.dart';

class ActivitiesGridViewItem extends StatelessWidget {
  const ActivitiesGridViewItem({super.key, required this.charity});

  final Charity charity;

  @override
  Widget build(BuildContext context) {
    final h = SizeApp(context).height;
    final w = SizeApp(context).width;
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(AppRouter.donate,
          extra: {'charityName': charity.charityName, 'charityId': charity.id}),
      child: Container(
        width: w * .03,
        height: h * .01,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(w * .02),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x1E000000),
              blurRadius: 12,
              offset: Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          children: [
            Image.network(charity.profilePic),
            const SizedBoxApp(
              h: .01,
            ),
            Text(charity.charityName),
          ],
        ),
      ),
    );
  }
}
