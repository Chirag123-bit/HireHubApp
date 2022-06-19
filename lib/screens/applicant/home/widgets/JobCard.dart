import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/TestJob.dart';
import 'package:hirehub/screens/applicant/home/widgets/job_details/DetailScreen.dart';

class JobCard extends StatelessWidget {
  final Job data;

  const JobCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [kCardShadow],
      ),
      child: OpenContainer(
        transitionType: ContainerTransitionType.fade,
        transitionDuration: const Duration(milliseconds: 500),
        openColor: kSilverColor,
        openElevation: 0,
        openBuilder: (context, action) {
          return DetailScreen(data: data);
        },
        closedColor: Colors.transparent,
        closedElevation: 0,
        closedBuilder: (context, action) {
          return Container(
            height: 125.w,
            padding: EdgeInsets.all(kSpacingUnit * 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(kSpacingUnit * 3),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      data.imgUrl,
                      height: 30.sp,
                      width: 30.sp,
                    ),
                    SizedBox(width: kSpacingUnit),
                    Text(
                      data.companyName,
                      style: kCardTitleTextStyle,
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      'assets/icons/heart_icon.svg',
                      height: 20.sp,
                      width: 20.sp,
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  data.position,
                  style: kSubTitleTextStyle,
                ),
                SizedBox(height: kSpacingUnit * 0.5),
                Text(
                  data.location,
                  style: kCaptionTextStyle,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
