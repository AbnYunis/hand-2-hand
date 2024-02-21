import 'package:flutter/material.dart';
import 'package:hand2hand/constants.dart';
import 'package:hand2hand/core/widgets/clip_path.dart';
import 'package:hand2hand/core/widgets/custom_app_bar.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:hand2hand/features/Auth/presentation/views/create_as_widgets/circle_widget.dart';

class CreateAsBody extends StatelessWidget {
  const CreateAsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: ClipPathApp(context: context, w: 0.5, h: 0.7, r: 1),
          child: Container(
            width: SizeApp(context).width,
            height: SizeApp(context).height * 1.1,
            color: const Color(0xffC5EDF8),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomAppBar(),
            const SizedBoxApp(h: 0.13),
            Text(
              'Create new account',
              style: TextStyle(
                  fontSize: SizeApp(context).width * 0.085,
                  fontWeight: FontWeight.w700,
                  color: mainColor1),
            ),
            const SizedBoxApp(h: 0.18),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleWidget(text: 'Charity'),
                CircleWidget(text: 'Donor'),
              ],
            ),
            const SizedBoxApp(h: 0.33),
          ],
        )
      ],
    );
  }
}
