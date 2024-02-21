import 'package:flutter/material.dart';
import 'package:hand2hand/constants.dart';
import 'package:hand2hand/core/utils/media_query.dart';

class SlideAnimatedText extends StatelessWidget {
  const SlideAnimatedText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context,_) {
          return SlideTransition(
            position: slidingAnimation,
            child: Text(
              'You can put a smile on someone\'s face',
              style: TextStyle(
                fontSize: SizeApp(context).width * 0.05,
                color: mainColor2,
                fontWeight: FontWeight.w700,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          );
        }
    );
  }
}
