import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hand2hand/constants.dart';
import 'package:hand2hand/core/utils/app_router.dart';
import 'package:hand2hand/core/utils/media_query.dart';

class CircleWidget extends StatelessWidget {
  const CircleWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        GoRouter.of(context).push(AppRouter.register);
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: mainColor2,
              spreadRadius: SizeApp(context).width * 0.002,
              blurRadius: SizeApp(context).width * 0.03,
              offset: Offset(
                  0,
                  SizeApp(context).height *
                      0.0075), // changes the position of the shadow
            ),
          ],
        ),
        child: CircleAvatar(
          radius: SizeApp(context).width * 0.18,
          backgroundColor: mainWhite,
          child: Text(
            text,
            style: TextStyle(
              fontSize: SizeApp(context).width * 0.04,
              fontWeight: FontWeight.w800,
              color: mainColor1,
            ),
          ),
        ),
      ),
    );
  }
}
