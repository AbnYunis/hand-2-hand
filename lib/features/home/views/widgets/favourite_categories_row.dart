import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../core/utils/media_query.dart';

class FavouriteCategoriesRow extends StatelessWidget {
  const FavouriteCategoriesRow({super.key});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    final h = SizeApp(context).height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: w * .05),
          child: const Text(
            'Favourite categories',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Text(
                'See All ',
                style: TextStyle(
                    color: mainColor1, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.arrow_forward,
                color: mainColor1,
              )
            ],
          ),
        ),
      ],
    )
    ;
  }
}
