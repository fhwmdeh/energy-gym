import 'package:energygym/view/screens/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        backgroundColor: Colors.white,
        splashIconSize: 500,
        curve: Curves.linear,
        splash: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 100,
          child: Image.asset(
            'images/gymlogo.png',
            width: 500,
            height: 500,
          ),
        ),
        splashTransition: SplashTransition.scaleTransition,
        animationDuration: const Duration(seconds: 3),
        pageTransitionType: PageTransitionType.bottomToTop,
        nextScreen: const MainScreen());
  }
}
