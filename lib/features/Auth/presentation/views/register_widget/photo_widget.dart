import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hand2hand/constants.dart';
import 'package:hand2hand/core/utils/functions/load_image.dart';
import 'package:hand2hand/core/utils/media_query.dart';

class PhotoWidget extends StatelessWidget {
  const PhotoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    File? imageFile;
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: mainColor2, width: SizeApp(context).width * 0.0025)),
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: SizeApp(context).width * 0.17,
                backgroundColor: Colors.transparent,
              ),
              CircleAvatar(
                radius: SizeApp(context).width * 0.15,
                backgroundImage: const NetworkImage(
                    'https://www.footballdatabase.eu/images/photos/players/a_8/8471.jpg'),
              )
            ],
          ),
        ),
        CircleAvatar(
          radius: SizeApp(context).width * 0.05,
          backgroundColor: iconsColor,
          child: IconButton(
              onPressed: () {
                chooseImage(context, imageFile)
                    .then((value) => imageFile = value);
              },
              icon: Icon(
                Icons.camera_enhance_sharp,
                color: scaffoldColor,
              )),
        )
      ],
    );
  }
}
