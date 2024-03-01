import 'package:flutter/material.dart';
import 'package:hand2hand/constants.dart';
import 'package:hand2hand/core/utils/media_query.dart';


class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    final h = SizeApp(context).height;
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search Campaign',
        contentPadding:  EdgeInsets.symmetric(horizontal: w*.03),
        prefixIcon: Icon(
          Icons.search,
          size: w * .08,
        ),
        suffixIcon: IconButton(
          icon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: h * .03,
                color: mainColor2,
                width: w * .003,
              ),
              SizedBox(
                width: w * .01,
              ),
              const Icon(
                Icons.mic,
              ),
            ],
          ),
          onPressed: () {
            // Handle mic icon tap
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(w*.05),
        ),
      ),
    );
  }
}
