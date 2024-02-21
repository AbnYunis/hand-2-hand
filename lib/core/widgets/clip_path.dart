import 'package:flutter/material.dart';

class ClipPathApp extends CustomClipper<Path>{
  final BuildContext context;
  final double w;
  final double h;
  final double r;

  ClipPathApp({super.reclip, required this.context, required this.w, required this.h, required this.r});

  @override
  Path getClip(Size size) {
    double height = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top;
    double width = MediaQuery.of(context).size.width;
    Path path = Path();
    path.addOval(Rect.fromCircle(center: Offset(width*w,height*h), radius: width*r));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}