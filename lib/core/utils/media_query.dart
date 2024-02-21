
import 'package:flutter/material.dart';

class SizeApp{
  final BuildContext context;
  double height;
  double width;
  SizeApp(this.context) :
    height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top,
    width = MediaQuery.of(context).size.width;


}
class SizedBoxApp extends StatelessWidget {
  const SizedBoxApp({super.key, this.h, this.w});
  final double? h;
  final double? w;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:SizeApp(context).height*(h??0) ,
      width:SizeApp(context).width*(w??0) ,
    );
  }
}
