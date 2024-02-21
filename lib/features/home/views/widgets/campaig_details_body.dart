import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hand2hand/core/utils/app_router.dart';
import 'package:hand2hand/core/utils/functions/assets_service.dart';
import 'package:hand2hand/core/widgets/custom_rounded_button.dart';
import 'package:hand2hand/features/home/views/widgets/campaign_details_image.dart';

import '../../../../core/utils/media_query.dart';
import 'campaign_details_row1.dart';
import 'description_widget.dart';

class CampaignDetailsBody extends StatelessWidget {
  const CampaignDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(w * .05),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffF5F5F5),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(w * .04),
              topRight: Radius.circular(w * .04),
            ),
          ),
          child: Column(
            children: [
              const CampaignDetailsImage(),
              Padding(
                padding: EdgeInsets.all(w * .05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CampaignDetailsRow1(),
                    const SizedBoxApp(
                      h: .015,
                    ),
                    Text(
                      'Educate Every child. Join Our Mission for Quality Education.',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: w * .043,
                      ),
                    ),
                    const SizedBoxApp(
                      h: .015,
                    ),
                    const DescriptionWidget(),
                    const SizedBoxApp(
                      h: .03,
                    ),
                    Text(
                      'Location:',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: w * .03,
                      ),
                    ),
                    const SizedBoxApp(
                      h: .01,
                    ),
                    Text(
                      'More 72 Str. 84569 Cairo, Mar',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: w * .03,
                          color: Colors.black.withOpacity(.65)),
                    ),
                  ],
                ),
              ),
              Center(
                child: CircleAvatar(
                  radius: w * .1,
                  backgroundColor: const Color(0xffCDF8DD),
                  child: Image.asset(
                    AssetsService.location,
                  ),
                ),
              ),
              const SizedBoxApp(
                h: .01,
              ),
              CustomRoundedButton(
                  text: 'Volunteer',
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.volunteer);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
