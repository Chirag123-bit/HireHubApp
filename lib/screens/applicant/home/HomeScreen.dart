import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/screens/applicant/home/widgets/HomeContent.dart';
import 'package:hirehub/screens/applicant/home/widgets/HomeHeader.dart';
import 'package:hirehub/screens/applicant/home/widgets/HomeSubHeader.dart';
import 'package:hirehub/theme/Theme.dart';

class HomeScreen extends StatelessWidget {
  //get applied jobs

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
            SizedBox(height: kSpacingUnit * 3),
            const HomeContent(),
          ],
        ),
      ),
    );
  }
}
