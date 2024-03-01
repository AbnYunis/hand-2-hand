import 'package:flutter/material.dart';
import 'package:hand2hand/core/utils/media_query.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon;

  const CustomTextField({super.key, required this.hint, required this.icon});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    return TextField(
      cursorColor: const Color(0xff3093A8),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: const Color(0xff3093A8),
        ),
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xff3093A8)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(w * .03),

          borderSide: const BorderSide(
              color: Color(0xff3093A8)), // Change the color here
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: w * .03),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(w * .03),

          borderSide: const BorderSide(
              color: Color(0xff3093A8)), // Change the color here
        ),
      ),
    );
  }
}
