import 'package:flutter/material.dart';
import 'package:hand2hand/core/utils/functions/assets_service.dart';
import 'package:hand2hand/core/utils/media_query.dart';


class RecommendedFirstSection extends StatelessWidget {
  const RecommendedFirstSection({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    final h = SizeApp(context).height;
    return  Container(
      width: w * .7,
      height: h * .2,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.2),
        borderRadius: BorderRadius.circular(w * .04),
        image:  DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: h * .008,
            right: w * .03,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: w * .012,
                ),
                SizedBox(
                  width: w * .01,
                ),
                const Text(
                  'Active',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          Positioned(
            bottom: h * .008,
            right: w * .03,
            child: Row(
              children: [
                Container(
                  height: h * .033,
                  width: w * .07,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xff2ecc71)),
                  child: const Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: w * .015),
                Container(
                  height: h * .033,
                  width: w * .07,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xff2ecc71)),
                  child: const Icon(
                    Icons.account_balance_wallet_outlined,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
