import 'package:flutter/material.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:hand2hand/features/explore_charities/presentation/views/widgets/explore_charities_grid_view.dart';


class ExploreCharitiesBody extends StatelessWidget {
  const ExploreCharitiesBody({super.key});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    return Padding(
      padding: EdgeInsets.all(w * .1),
      child: Column(
        children: [
          Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(w * .02)),
              shadows: const [
                BoxShadow(
                  color: Color(0x1E000000),
                  blurRadius: 12,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: 'Search ',
                contentPadding: EdgeInsets.symmetric(horizontal: w * .03),
                prefixIcon: Icon(
                  Icons.search,
                  size: w * .06,
                ),
                suffixIcon: Icon(
                  Icons.close,
                  size: w * .06,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(w * .04),
                ),
              ),
            ),
          ),
          const SizedBoxApp(
            h: .1,
          ),
          const ExploreCharitiesGridView(),
        ],
      ),
    );
  }
}
