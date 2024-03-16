import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hand2hand/core/utils/app_router.dart';
import 'package:hand2hand/core/utils/functions/assets_service.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:hand2hand/core/widgets/custom_rounded_button.dart';


class CongratulationBody extends StatelessWidget {
  const CongratulationBody({super.key});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AssetsService.checkCircle),
          Text(
            'Congratulations!',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: w * .08),
          ),
          const SizedBoxApp(
            h: .02,
          ),
          Text(
            'Your donation is successful',
            style: TextStyle(
              fontSize: w * .03,
              color: const Color(0xff999999),
            ),
          ),
          const SizedBoxApp(
            h: .1,
          ),
          CustomRoundedButton(
            text: 'Back to home',
            onPressed: () {
              GoRouter.of(context).pushReplacement(AppRouter.home,);

            },
          ),
        ],
      ),
    );
  }
}
