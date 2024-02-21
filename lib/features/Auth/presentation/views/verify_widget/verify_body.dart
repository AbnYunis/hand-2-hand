import 'package:flutter/material.dart';
import 'package:hand2hand/constants.dart';
import 'package:hand2hand/core/widgets/clip_path.dart';
import 'package:hand2hand/core/widgets/custom_app_bar.dart';
import 'package:hand2hand/core/widgets/custom_rectangle_button.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class VerifyBody extends StatelessWidget {
  const VerifyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
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
            children: [
              const SizedBoxApp(h: 0.07),
              const CustomAppBar(),
              const SizedBoxApp(h: 0.2),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'Verify code',
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
              const SizedBoxApp(h: 0.05),
              Text(
                'example@email.com',
                style: TextStyle(
                  fontSize: SizeApp(context).width * 0.03,
                  fontWeight: FontWeight.w600,
                  color: mainColor1,
                ),
              ),
              const SizedBoxApp(h: 0.03),
              OTPTextField(
                otpFieldStyle: OtpFieldStyle(backgroundColor: mainWhite),
                length: 4,
                width: SizeApp(context).width * 0.8,
                fieldWidth: SizeApp(context).width * 0.15,
                onChanged: (x) {},
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                onCompleted: (pin) {
                  print("Completed: " + pin);
                },
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBoxApp(h: 0.04),
                      Text(
                        'Didn\'t receive OTP?',
                        style: TextStyle(
                          fontSize: SizeApp(context).width * 0.033,
                          fontWeight: FontWeight.w400,
                          color: mainColor2,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Resend code',
                          style: TextStyle(
                            fontSize: SizeApp(context).width * 0.028,
                            fontWeight: FontWeight.w600,
                            color: mainColor1,
                          ),
                        ),
                      ),
                      const SizedBoxApp(h: 0.09),
                      const CustomRectangleButton(text: 'Verify'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
