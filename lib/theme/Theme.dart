// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishClr = Color(0xff4e5ae8);
const Color yellowClr = Color(0xffffb746);
const Color pinkClr = Color(0xffff4667);
const Color white = Colors.white;
const primaryClr = bluishClr;
const Color darkGreyClr = Color(0xff121212);
const Color darkHeaderClr = Color(0xff424242);

class Themes {
  static final light = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryClr,
    fontFamily: "OpenSans",
    // textTheme: GoogleFonts.muliTextTheme(),
    // visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: darkGreyClr,
    fontFamily: "OpenSans",
    // textTheme: GoogleFonts.muliTextTheme(),
  );
}

TextStyle get subHeadingStyle {
  return GoogleFonts.openSans(
      textStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? Colors.grey[400] : Colors.grey));
}

TextStyle get headingStyle {
  return GoogleFonts.openSans(
      textStyle: const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ));
}

TextStyle get titleStyle {
  return GoogleFonts.openSans(
      textStyle: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    // color: Get.isDarkMode ? Colors.white : Colors.black,
  ));
}

TextStyle get subTitleStyle {
  return GoogleFonts.openSans(
      textStyle: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Get.isDarkMode ? Colors.grey[100] : Colors.grey[600],
  ));
}
