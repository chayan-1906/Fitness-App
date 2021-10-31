import 'package:fitness_app/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnBoardingScreen(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xFF192A56),
        ),
      ),
    );
  }
}
