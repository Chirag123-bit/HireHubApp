import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/dashboardJobModels/DashboardJob.dart';

class DetailHeader extends StatelessWidget {
  const DetailHeader({
    Key? key,
    required this.data,
  }) : super(key: key);

  final DashboardJob data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: kSpacingUnit * 2,
        vertical: kSpacingUnit * 3,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(
              'assets/icons/chevron_left_icon.svg',
              height: 30.sp,
              width: 30.sp,
              color: Get.isDarkMode ? Colors.white : Colors.blue,
            ),
          ),
          Text(
            "Google Inc",
            style: kSubTitleTextStyle.copyWith(
              fontWeight: FontWeight.w600,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(width: 30.sp),
        ],
      ),
    );
  }
}
