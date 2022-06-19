import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/filterModels/BottomSheet.dart';
import 'package:hirehub/screens/applicant/ApplicantMainScreen.dart';
import 'package:hirehub/screens/applicant/category/CategoryScreen.dart';
import 'package:hirehub/screens/applicant/filter/FilterPage.dart';
import 'package:hirehub/screens/auth/Login.dart';
import 'package:hirehub/screens/auth/Register.dart';
import 'package:hirehub/screens/splash/splashScreen.dart';
import 'package:provider/provider.dart';

import 'config/Palette.dart';

void main() {
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //     overlays: [SystemUiOverlay.bottom]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return ChangeNotifierProvider<MyBottomSheetModel>(
        create: (_) => MyBottomSheetModel(),
        child: MaterialApp(
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
          initialRoute: "/filter",
          routes: {
            "/": (context) => const SplashScreen(),
            "/home": (context) => const ApplicantMainPage(),
            "/login": (context) => const LoginScreen(),
            "/register": (context) => const Register(),
            "/category": (context) => const CategoryScreen(),
            "/filter": (context) => const FilterPage(),
          },
        ));
  }
}
