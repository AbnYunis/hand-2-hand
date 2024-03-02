import 'package:flutter/material.dart';
import 'package:hand2hand/constants.dart';
import 'package:hand2hand/core/widgets/clip_path.dart';
import 'package:hand2hand/core/widgets/custom_app_bar.dart';
import 'package:hand2hand/core/utils/media_query.dart';

import 'forget_form.dart';

class ForgetPassBody extends StatelessWidget {
  const ForgetPassBody({super.key, required this.isRegister});
  final bool isRegister;

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
                  isRegister?'Verify Email':'Forgot Password',
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
              ForgetForm(isRegister: isRegister),
            ],
          ),
        )
      ],
    );
  }
}

