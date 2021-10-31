import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'home_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var pages = [
    PageViewModel(
      title: "Title of first page",
      body:
          "Here you can write the description of the page, to explain something...",
      image: Center(
        child: Image.asset("assets/screen1.png", height: 175.0),
      ),
      decoration: const PageDecoration(
        pageColor: Color(0xFF192A56),
        bodyTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontFamily: 'RobotoSlab',
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontFamily: 'RobotoSlab',
        ),
      ),
    ),
    PageViewModel(
      title: "Title of first page",
      body:
          "Here you can write the description of the page, to explain something...",
      image: Center(
        child: Image.asset("assets/screen2.png", height: 175.0),
      ),
      decoration: const PageDecoration(
        pageColor: Color(0xFF192A56),
        bodyTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontFamily: 'RobotoSlab',
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontFamily: 'RobotoSlab',
        ),
      ),
    ),
    PageViewModel(
      title: "Title of first page",
      body:
          "Here you can write the description of the page, to explain something...",
      image: Center(
        child: Image.asset("assets/screen3.png", height: 175.0),
      ),
      decoration: const PageDecoration(
        pageColor: Color(0xFF192A56),
        bodyTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontFamily: 'RobotoSlab',
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontFamily: 'RobotoSlab',
        ),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: pages,
        onDone: () {
          // When done button is press
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
        },
        onSkip: () {
          // You can also override onSkip callback
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
        },
        showSkipButton: true,
        skip: const Icon(
          Icons.skip_next_rounded,
          color: Colors.purpleAccent,
        ),
        next: const Icon(
          Icons.arrow_right_rounded,
          color: Colors.greenAccent,
        ),
        done: const Text(
          "Done",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Colors.lightBlue),
        ),
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Color(0xFFEF5350),
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
    );
  }
}
