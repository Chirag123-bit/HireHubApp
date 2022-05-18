import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hirehub/screens/auth/auth.dart';
import 'package:hirehub/views/OnboardingScreen/GettingStarted.dart';
import 'package:hirehub/views/SignupScreen/SignUpScreen.dart';

import 'config/Palette.dart';
import 'views/LoginScreen/LoginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.muliTextTheme(),
        accentColor: Palette.darkOrange,
        appBarTheme: const AppBarTheme(
          brightness: Brightness.dark,
          color: Palette.darkBlue,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/auth",
      routes: {
        "/": (context) => const GettingStarted(),
        "/signup": (context) => const SignUpScreen(),
        "/login": (context) => const LoginScreen(),
        "/auth": (context) => const AuthScreen(),
      },
    );
  }
}
