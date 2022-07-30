import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hirehub/screens/splash/splashScreen.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class AnimatedSplashScreens extends StatelessWidget {
  const AnimatedSplashScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      nextScreen: const SplashScreen(),
      splash: Lottie.asset('assets/icons/splash.json'),
      duration: 2000,
      splashTransition: SplashTransition.sizeTransition,
      pageTransitionType: PageTransitionType.bottomToTop,
      splashIconSize: 350,
    );
  }
}
