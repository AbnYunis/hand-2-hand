import 'package:flutter/material.dart';

import '../../../../../core/widgets/clip_path.dart';

class ClipPart extends StatelessWidget {
  const ClipPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: ClipPathApp(context: context,h: 0.25,w: 0.8,r: 0.6 ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color(0xffC5EDF8),
          ),
        ),
        ClipPath(
          clipper: ClipPathApp(context: context,h: 0.2,w: 0.2,r: 0.5),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color:Color(0xffA9D5FC),
          ),
        ),

      ],
    );
  }
}
