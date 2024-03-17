import 'package:flutter/material.dart';
import 'package:hand2hand/core/utils/media_query.dart';

import '../../constants.dart';

class CustomAuthTextField extends StatelessWidget {
  const CustomAuthTextField({
    super.key,
    required this.text,
    this.icon, this.validate, this.controller, this.isPassword,
  });

  final String text;
  final IconData? icon;
  final bool? isPassword ;
  final String? Function(String?)? validate;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        errorMaxLines: 5,
        helperMaxLines: 5,
        helperText: isPassword??false?"Password Must be at least 8 characters and should contain at least one upper case , lower case ,Special character and one digit":"",
        helperStyle: TextStyle(fontSize: SizeApp(context).width*0.03,fontWeight: FontWeight.w300,color: Colors.black45),
        hintText: text,
        errorStyle: TextStyle(fontSize: SizeApp(context).width*0.03,fontWeight: FontWeight.w300,color: Colors.red),
        hintStyle: const TextStyle(fontWeight: FontWeight.w700),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SizeApp(context).width*0.05),
            borderSide: BorderSide.none),
        fillColor: mainWhite,
        filled: true,
        prefixIcon: icon != null ? Icon(icon, color: iconsColor) : null,
      ),
      validator: validate,controller: controller,
    );
  }
}
