import 'package:flutter/material.dart';
import 'package:hand2hand/constants.dart';

class CustomRoundedButton extends StatelessWidget {
  const CustomRoundedButton({
    Key? key,
    required this.text,
    this.width,
    required this.onPressed,
    this.height,
  }) : super(key: key);

  final String text;
  final Function() onPressed;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialButton(
      onPressed: onPressed ?? () {},
      color: mainColor1,
      minWidth: size.width * 0.75,
      height: size.height * 0.06,
      shape: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(size.width * 0.1)),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: size.width * 0.035,
            color: scaffoldColor),
      ),
    );
  }
}
