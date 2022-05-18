import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hirehub/screens/auth/auth.dart';

import 'config/Palette.dart';

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
      initialRoute: "/",
      routes: {
        "/": (context) => const AuthScreen(),
      },
    );
  }
}
