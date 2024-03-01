import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hand2hand/core/utils/app_router.dart';
import 'package:hand2hand/core/utils/functions/assets_service.dart';
import 'package:hand2hand/core/utils/media_query.dart';


class ActivitiesGridViewItem extends StatelessWidget {
  const ActivitiesGridViewItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    List<String> clicks = [
      AppRouter.donate,
      AppRouter.donate,
      AppRouter.donate,
      AppRouter.donate,
      AppRouter.donate,
      AppRouter.donate,
    ];
    final h = SizeApp(context).height;
    final w = SizeApp(context).width;
    return GestureDetector(
      onTap: () => context.push(clicks[index]),
      child: Container(
        width: w * .03,
        height: h * .01,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(w * .02)),
          shadows: const [
            BoxShadow(
              color: Color(0x1E000000),
              blurRadius: 12,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Image.asset(AssetsService.charities[index]),
      ),
    );
  }
}
