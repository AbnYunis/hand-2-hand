import 'package:flutter/material.dart';
import 'package:hand2hand/constants.dart';
import 'package:hand2hand/core/widgets/clip_path.dart';
import 'package:hand2hand/core/widgets/custom_app_bar.dart';
import 'package:hand2hand/core/utils/media_query.dart';

import 'reset_pass_form.dart';

class ResetPassBody extends StatelessWidget {
  const ResetPassBody({super.key, required this.parameters});
  final Map<String, dynamic> parameters;

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
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeApp(context).width * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBoxApp(h: 0.07),
              const CustomAppBar(),
              const SizedBoxApp(h: 0.25),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: SizeApp(context).width * 0.045,
                    fontWeight: FontWeight.w800,
                    color: mainColor1,
                  ),
                ),
              ),
              const SizedBoxApp(h: 0.06),
              Container(
                height: SizeApp(context).height * 0.0004,
                color: mainColor2,
              ),
              ResetPassForm(parameters: parameters),
            ],
          ),
        )
      ],
    );
  }
}

