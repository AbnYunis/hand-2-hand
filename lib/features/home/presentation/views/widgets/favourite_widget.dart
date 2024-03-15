import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hand2hand/core/utils/app_router.dart';
import 'package:hand2hand/core/utils/media_query.dart';


class DonateWidget extends StatelessWidget {
  const DonateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    final h = SizeApp(context).height;
    return Padding(
      padding: EdgeInsets.only(right: w * .2),
      child: InkWell(
        onTap: () {
          GoRouter.of(context).push(AppRouter.exploreCharities);
        },
        child: Container(
          height: h * .06,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xff1B799B)),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Donate',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.arrow_forward_rounded,
                color: Color(0xff1B799B),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
