import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hand2hand/constants.dart';
import 'package:hand2hand/core/utils/functions/load_image.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:hand2hand/core/utils/shared_data.dart';

class PhotoWidget extends StatefulWidget {
  const PhotoWidget({
    super.key,
  });

  @override
  State<PhotoWidget> createState() => _PhotoWidgetState();
}

class _PhotoWidgetState extends State<PhotoWidget> {
  File? imageFile;
  @override
  Widget build(BuildContext context) {

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
                backgroundImage: imageFile != null
                    ? FileImage(imageFile!) as ImageProvider
                    : const NetworkImage(
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
                    .then((value) {setState(() {
                  imageFile = value;
                  _saveImageToPrefs(imageFile);
                    });});
              },
              icon: Icon(
                Icons.camera_enhance_sharp,
                color: scaffoldColor,
              )),
        )
      ],
    );
  }
  Future<void> _saveImageToPrefs(File? imageFile) async {
    final bytes = await imageFile!.readAsBytes();
    final String encodedImage = base64Encode(bytes);
    SharedData.saveUserImage(userImage: encodedImage);
  }
}