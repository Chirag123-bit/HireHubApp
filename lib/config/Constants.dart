import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const kBackgroundColor = Color(0xFFFAFAFA);
const kBlack = Color(0xFF21282A);
const kBlackAccent = Color(0xFF3A3A3A);
const kSilver = Color(0xFFF6F6F6);
const kOrange = Color(0xFFFA5805);

var kPageTitleStyle = GoogleFonts.roboto(
  fontSize: 23,
  fontWeight: FontWeight.w800,
  wordSpacing: 2.5,
);
var kTitleStyle = GoogleFonts.roboto(
  fontSize: 18,
  fontWeight: FontWeight.w600,
);
var kSubtitleStyle = GoogleFonts.roboto(
  fontSize: 14,
  color: kBlack,
);

const TextStyle kMedStyle = TextStyle(
  fontWeight: FontWeight.normal,
  fontFamily: "Poppins",
);

const TextStyle kBoldStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontFamily: "Poppins",
);

final kSpacingUnit = 10.00.w;

const kSilverColor = Color(0xFFF6F7FB);
const kAccentColor = Color(0xFFED5575);
const kPrimaryTextColor = Color(0xFF211D42);
const kSecondaryTextColor = Color(0xFFB9B8CD);

final kCardShadow = BoxShadow(
  color: const Color.fromRGBO(0, 0, 0, 0.05),
  blurRadius: 20.w,
  offset: Offset(10.w, 10.w),
);

final kFooterShadow = BoxShadow(
  color: const Color.fromRGBO(0, 0, 0, 0.10),
  blurRadius: 50.w,
  offset: Offset(0, -10.w),
);

final kHeadingTextStyle = TextStyle(
  color: Get.isDarkMode ? Colors.white : kPrimaryTextColor,
  fontFamily: 'SF Pro Rounded',
  fontSize: 34.sp,
  fontWeight: FontWeight.w100,
);

final kTitleTextStyle = TextStyle(
  color: Get.isDarkMode ? Colors.white : kPrimaryTextColor,
  fontSize: 17.sp,
  fontWeight: FontWeight.w500,
);

final kSubTitleTextStyle = TextStyle(
  color: kPrimaryTextColor,
  fontSize: 15.sp,
  fontWeight: FontWeight.w500,
);

final kCardTitleTextStyle = TextStyle(
  color: kSecondaryTextColor,
  fontSize: 13.sp,
  fontWeight: FontWeight.w500,
);

final kBodyTextStyle = TextStyle(
  color: kPrimaryTextColor,
  fontSize: 11.sp,
);

final kCaptionTextStyle = TextStyle(
  color: kSecondaryTextColor,
  fontSize: 12.sp,
);

final navTextSize = 16.sp;
