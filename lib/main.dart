import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hand2hand/core/utils/app_router.dart';

import 'core/utils/functions/material_color.dart';
import 'core/utils/service_locator.dart';
import 'core/utils/shared_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedData.init();
  ServiceLocator().init();
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
