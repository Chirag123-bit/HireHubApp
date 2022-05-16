import 'package:flutter/material.dart';
import 'package:hirehub/views/OnboardingScreen/GettingStarted.dart';
import 'package:hirehub/views/SignupScreen/SignUpScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const GettingStarted(),
        "/signup": (context) => const SignUpScreen(),
      },
    );
  }
}
