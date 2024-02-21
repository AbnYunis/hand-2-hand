import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../core/utils/media_query.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Location',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBoxApp(h: .01),
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'location',
                  contentPadding: EdgeInsets.symmetric(horizontal: w * .03),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(w * .02),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () async {},
              icon: Icon(
                Icons.location_on,
                color: mainColor1,
                size: MediaQuery.sizeOf(context).width * 0.1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
