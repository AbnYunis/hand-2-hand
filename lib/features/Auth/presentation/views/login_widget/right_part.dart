import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hand2hand/constants.dart';
import 'package:hand2hand/core/utils/app_router.dart';

class RightPart extends StatelessWidget {
  const RightPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: TextButton(
        onPressed: () {
          GoRouter.of(context).push(AppRouter.forgetPass);
        },
        child: Text(
          'Forget password?',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: mainColor1,
          ),
        ),
      ),
    );
  }
}
