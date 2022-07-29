import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/Company.dart';

class CompanyCard extends StatelessWidget {
  Company company;
  CompanyCard({Key? key, required this.company}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: kSpacingUnit * 1),
      margin: EdgeInsets.symmetric(horizontal: kSpacingUnit * 0.5),
      decoration: BoxDecoration(
        border: Border.all(
            color: Get.isDarkMode ? Colors.white : Colors.black, width: 1),
        borderRadius: BorderRadius.circular(kSpacingUnit * 2),
      ),
      child: Column(
        children: [
          const Spacer(),
          SvgPicture.asset(
            company.avatarImage!,
            height: 50.sp,
            width: 50.sp,
          ),
          const Spacer(),
          Text(
            company.name!,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            company.country! + ", " + company.region!,
            style: TextStyle(fontSize: 12.sp),
          ),
          const Spacer(),
          //button to view company profile

          // const Spacer(),
        ],
      ),
    );
  }
}
