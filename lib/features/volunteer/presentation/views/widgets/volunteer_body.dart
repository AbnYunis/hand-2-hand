import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hand2hand/core/utils/app_router.dart';
import 'package:hand2hand/core/utils/functions/assets_service.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:hand2hand/core/widgets/custom_rounded_button.dart';
import 'package:hand2hand/core/widgets/custom_snack_bar.dart';
import 'package:hand2hand/features/volunteer/presentation/manager/volunteer_cubit.dart';
import 'package:hand2hand/features/volunteer/presentation/manager/volunteer_state.dart';

class VolunteerBody extends StatelessWidget {
  const VolunteerBody({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    final h = SizeApp(context).height;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(w * .05),
        child: Column(
          children: [
            Image.asset(AssetsService.volunteer),
            const SizedBoxApp(
              h: .02,
            ),
            Text(
              'Give Your Time, Make An Impact',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: w * .05),
            ),
            const SizedBoxApp(
              h: .01,
            ),
            BlocConsumer<VolunteerCubit, VolunteerState>(
              listener: (context, state) {
                if(state is VolunteerSuccess){
                  context.push(AppRouter.home);
                  snackBar('charity will contact with you', context, Colors.white);
                }
                if(state is VolunteerFailure){
                  snackBar(state.errorMessage+" try again", context, Colors.red);
                }
              },
              builder: (context, state) {
                if(state is VolunteerLoading) {
                  return CircularProgressIndicator();
                }else {
                  return CustomRoundedButton(
                      width: w * .5,
                      height: h * .04,
                      text: 'Apply Now',
                      onPressed: () {
                        BlocProvider.of<VolunteerCubit>(context).volunteer(id);
                      });
                }
              },
            ),
            const SizedBoxApp(
              h: .02,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Why signe up as a volunteer ?',
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: w * .05),
                ),
                const Text(
                    'Signing up as a volunteer allows you to actively participate in improving the lives of others and making a difference in your community.\n\n'
                        'By dedicating your time and efforts. you can contribute to important social causes, support chantable organizations, and heip those who are less fortunate.\n\n'
                        'As a volunteer, you have the chance to expand your horizons, learn about critical social issues, and develop valuable skills that can benefit you both personally and professionally.\n\n'
                        'Moreover, the satisfaction and fulfillment you experience from giving back are immeasurable, and your commitment can inspire otners to join in, creating a powerful collective impact that transforms lives and creates a brighter future for all.\n')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
