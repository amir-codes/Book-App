import 'package:flutter/material.dart';
import 'package:pdf_viewer/splash_screen.dart';

import 'theme_changer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ChangeTheme changer = ChangeTheme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: SplashScreen(),
    );
  }
}
