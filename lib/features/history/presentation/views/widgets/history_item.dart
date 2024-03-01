import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hand2hand/core/utils/app_router.dart';
import 'package:hand2hand/core/utils/functions/assets_service.dart';
import 'package:hand2hand/core/utils/media_query.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    final h = SizeApp(context).height;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: h * .01),
      child: InkWell(
        onTap: () => GoRouter.of(context).push(AppRouter.trackDonation),
        child: Container(
          padding: EdgeInsets.all(w * .03),
          decoration: ShapeDecoration(
            color: const Color(0xff3093A8).withOpacity(.1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(w * .015),
              side: const BorderSide(
                color: Color(0xff3093A8),
              ),
            ),
          ),
          height: h * .13,
          child: Row(
            children: [
              Image.asset(
                AssetsService.camera,
                height: h * .1,
                width: w * .2,
              ),
              const SizedBoxApp(
                w: .02,
              ),
              const Column(
                children: [
                  Text(
                    'We care you',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Cate : food',
                    style: TextStyle(color: Color(0xffB2B2B4)),
                  )
                ],
              ),
              const SizedBoxApp(
                w: .02,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    '06th jul 2023',
                    style: TextStyle(color: Color(0xffB2B2B4)),
                  ),
                  const Text(
                    '1:45 Pm',
                    style: TextStyle(color: Color(0xffB2B2B4)),
                  ),
                  Container(
                    height: h * .03,
                    width: w * .35,
                    decoration: ShapeDecoration(
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(w * .1)),
                    ),
                    child: const Center(
                      child: Text(
                        'Completed',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
