import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hand2hand/core/utils/app_router.dart';

import 'core/utils/functions/material_color.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(),
        primarySwatch: createMaterialColor(const Color(0xFF969FAB)),
      ),
    );
  }
}
