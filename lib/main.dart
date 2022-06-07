import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/screens/applicant/ApplicantMainScreen.dart';
import 'package:hirehub/screens/auth/auth.dart';
import 'package:hirehub/screens/splash/splashScreen.dart';

import 'config/Palette.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: kSilver,
        primaryColor: const Color.fromARGB(255, 41, 63, 233),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.muliTextTheme(),
        appBarTheme: const AppBarTheme(
          color: Palette.darkBlue,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: Palette.darkOrange)
            .copyWith(secondary: const Color(0xFFFED408)),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashScreen(),
        "/auth": (context) => const AuthScreen(),
        "/home": (context) => const ApplicantMainPage(),
      },
    );
  }
}
