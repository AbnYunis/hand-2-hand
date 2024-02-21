import 'package:flutter/material.dart';

import '../../constants.dart';
import '../utils/media_query.dart';

class CustomRectangleButton extends StatelessWidget {
  const CustomRectangleButton({
    super.key, required this.text, this.press,
  });
  final String text;
  final void Function()? press;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: press??() {},
      color: mainColor1,
      minWidth: SizeApp(context).width * 0.75,
      height: SizeApp(context).height * 0.06,
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
