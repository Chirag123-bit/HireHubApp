import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hirehub/screens/auth/auth.dart';
import 'package:hirehub/screens/home/HomeScreen.dart';

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
        primaryColor: Color.fromARGB(255, 41, 63, 233),
        accentColor: Color(0xFFFED408),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.muliTextTheme(),
        appBarTheme: const AppBarTheme(
          color: Palette.darkBlue,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Palette.darkOrange),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const AuthScreen(),
        "/home": (context) => const HomePage(),
      },
    );
  }
}
