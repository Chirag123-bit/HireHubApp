import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/screens/applicant/home/widgets/HomeContent.dart';
import 'package:hirehub/screens/applicant/home/widgets/HomeHeader.dart';
import 'package:hirehub/screens/applicant/home/widgets/HomeSubHeader.dart';
import 'package:hirehub/theme/Theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  bool isUpdating = false;
  bool isImageLoading = false;
  late String _imageUrl;
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeHeader(),
            SizedBox(height: kSpacingUnit * 3),
            const HomeSubHeader(),
            SizedBox(height: kSpacingUnit * 1.5),
            const HomeContent(),
          ],
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   detector.stopListening();
  //   super.dispose();
  // }
}
