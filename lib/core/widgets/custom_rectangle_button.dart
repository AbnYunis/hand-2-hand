import 'package:flutter/material.dart';

import '../../constants.dart';
import '../utils/media_query.dart';

class CustomRectangleButton extends StatelessWidget {
  const CustomRectangleButton({
    super.key,
    required this.text,
    this.press,
    this.width,
    this.height,
  });

  final String text;
  final double? width;
  final double? height;
  final void Function()? press;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: press ?? () {},
      color: mainColor1,
      minWidth: width ?? SizeApp(context).width * 0.75,
      height: height ?? SizeApp(context).height * 0.06,
      shape: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(SizeApp(context).width * 0.015)),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: SizeApp(context).width * 0.035,
            color: scaffoldColor),
      ),
    );
  }
}
