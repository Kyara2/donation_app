import 'package:donation_app/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:material_color_generator/material_color_generator.dart';

MaterialColor colorCustom =
    generateMaterialColor(color: const Color(0xFF0E1647)); //0E1647

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        scaffoldBackgroundColor: colorCustom,
        primarySwatch: colorCustom,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          titleLarge: TextStyle(color: Colors.white),
          titleSmall: TextStyle(color: Colors.white),
        )),
    home: const SplashScreen(),
  ));
}
