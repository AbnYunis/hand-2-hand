import 'package:flutter/material.dart';
import 'package:hand2hand/constants.dart';

class CustomRoundedButton extends StatelessWidget {
  const CustomRoundedButton({
    Key? key,
    required this.text,
    this.width,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final Function() onPressed;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: (size.height * 0.0603).floorToDouble(),
        width: width ?? (size.width * .65).floorToDouble(),
        decoration: BoxDecoration(
          color: mainColor1,
          borderRadius: BorderRadius.all(Radius.circular(size.width * 0.1)),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
