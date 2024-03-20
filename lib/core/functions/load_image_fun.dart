import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:hand2hand/core/utils/shared_data.dart';
import 'package:path_provider/path_provider.dart';

Future<File> loadImageFromPrefs() async {
  // Load the encoded image string from shared preferences
  String? encodedImage = SharedData.getLocalUserImage();


  // Decode the image string back to bytes
  Uint8List bytes = base64Decode(encodedImage!);

  // Create a file in a temporary directory to save the image
  Directory tempDir = await getTemporaryDirectory();
  File imageFile = File('${tempDir.path}/user_image.png');

  // Write the bytes to the file
  await imageFile.writeAsBytes(bytes);

  // Return the file
  return imageFile;
}
