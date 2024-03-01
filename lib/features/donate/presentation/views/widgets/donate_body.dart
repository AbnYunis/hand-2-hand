import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hand2hand/core/utils/app_router.dart';
import 'package:hand2hand/core/utils/functions/assets_service.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:hand2hand/core/widgets/custom_rounded_button.dart';
import 'package:hand2hand/features/donate/presentation/views/widgets/charity_widget.dart';
import 'package:hand2hand/features/donate/presentation/views/widgets/description_widget.dart';
import 'package:hand2hand/features/donate/presentation/views/widgets/dropdown_widget.dart';
import 'package:hand2hand/features/donate/presentation/views/widgets/item_count_widget.dart';
import 'package:hand2hand/features/donate/presentation/views/widgets/location_widget.dart';

class DonateBody extends StatelessWidget {
  const DonateBody({super.key});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    final h = SizeApp(context).height;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(w * .04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CharityWidget(),
            const SizedBoxApp(h: .01),
            const ItemCountWidget(),
            const SizedBoxApp(h: .01),
            const DescriptionWidget(),
            const SizedBoxApp(h: .01),
            const Text(
              'Donation type',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBoxApp(h: .01),
            const DropDownWidget(),
            const SizedBoxApp(h: .01),
            const LocationWidget(),
            const SizedBoxApp(h: .01),
            Container(
              height: h * .25,
              width: double.infinity,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Color(0xff9A9A9A)),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AssetsService.camera),
                  const SizedBoxApp(
                    h: .015,
                  ),
                  const Text(
                    'Take a photo',
                    style: TextStyle(color: Color(0xff9A9A9A)),
                  ),
                ],
              ),
            ),
            const SizedBoxApp(h: .01),
            Center(
              child: CustomRoundedButton(
                text: 'Donate',
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.congratulation);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
