import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/screens/applicant/home/widgets/HomeContent.dart';
import 'package:hirehub/screens/applicant/home/widgets/HomeHeader.dart';
import 'package:hirehub/screens/applicant/home/widgets/HomeSubHeader.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      backgroundColor: Colors.white,
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
