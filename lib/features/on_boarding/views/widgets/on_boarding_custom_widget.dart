import 'package:flutter/material.dart';
import 'package:hand2hand/core/widgets/custom_rounded_button.dart';

class OnBoardingCustomWidget extends StatelessWidget {
  const OnBoardingCustomWidget(
      {super.key,
      required this.image,
      required this.text1,
      required this.text2,
      required this.textButton,
      required this.onPressed});

  final String image;
  final String text1;
  final String text2;
  final String textButton;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(image),
        Column(
          children: [
            Text(
              text1,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * .01,
            ),
            Text(
              text2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        CustomRoundedButton(text: textButton, onPressed: onPressed)
      ],
    );
  }
}
