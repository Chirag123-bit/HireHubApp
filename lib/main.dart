import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hirehub/database/DbHelper.dart';
import 'package:hirehub/screens/applicant/ApplicantMainScreen.dart';
import 'package:hirehub/screens/applicant/category/CategoryScreen.dart';
import 'package:hirehub/screens/applicant/filter/FilterPage.dart';
import 'package:hirehub/screens/applicant/todo/TodoScreen.dart';
import 'package:hirehub/screens/auth/Login.dart';
import 'package:hirehub/screens/auth/Register.dart';
import 'package:hirehub/screens/splash/splashScreen.dart';
import 'package:hirehub/services/theme_services.dart';
import 'package:hirehub/theme/Theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.initDb();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return GetMaterialApp(
      // theme: ThemeData(
      //   backgroundColor: kSilver,
      //   primaryColor: const Color.fromARGB(255, 41, 63, 233),
      //   brightness: Brightness.light,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      //   textTheme: GoogleFonts.muliTextTheme(),
      //   appBarTheme: const AppBarTheme(
      //     color: Palette.darkBlue,
      //     systemOverlayStyle: SystemUiOverlayStyle.light,
      //   ),
      //   colorScheme: ColorScheme.fromSwatch()
      //       .copyWith(secondary: Palette.darkOrange)
      //       .copyWith(secondary: const Color(0xFFFED408)),
      // ),

      darkTheme: Themes.dark,
      theme: Themes.light,
      themeMode: ThemeServices().theme,
      debugShowCheckedModeBanner: false,
      initialRoute: "/todo",
      routes: {
        "/": (context) => const SplashScreen(),
        "/home": (context) => const ApplicantMainPage(),
        "/login": (context) => const LoginScreen(),
        "/register": (context) => const Register(),
        "/category": (context) => const CategoryScreen(),
        "/filter": (context) => const FilterPage(),
        "/todo": (context) => const TodoScreen(),
      },
    );
  }
}
