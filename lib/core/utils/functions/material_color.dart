import 'package:flutter/material.dart';

MaterialColor createMaterialColor(Color color) {
  List<int> strengths = <int>[50, 100, 200, 300, 400, 500, 600, 700, 800, 900];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int strength in strengths) {
    final double weight = 0.5 - (strength / 1000.0);
    final int blendR = (r * weight).round() + ((255 * (1.0 - weight)).round());
    final int blendG = (g * weight).round() + ((255 * (1.0 - weight)).round());
    final int blendB = (b * weight).round() + ((255 * (1.0 - weight)).round());

    swatch[strength] = Color.fromRGBO(blendR, blendG, blendB, 1);
  }

  return MaterialColor(color.value, swatch);
}