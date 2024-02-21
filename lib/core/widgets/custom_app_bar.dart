import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/media_query.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon:  Icon(
            Icons.arrow_back_sharp,
            size: SizeApp(context).width*0.07,
          ),
        ),
        if (text != null) Text(text!),
      ],
    );
  }
}
