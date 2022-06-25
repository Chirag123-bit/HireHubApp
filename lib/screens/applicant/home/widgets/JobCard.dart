import 'dart:math';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/Job.dart';
import 'package:hirehub/screens/applicant/home/widgets/job_details/DetailScreen.dart';

class JobCard extends StatelessWidget {
  final Job data;

  JobCard({Key? key, required this.data}) : super(key: key);
  List<LinearGradient> gradients = [
    const LinearGradient(
      colors: [Color(0xffaddbaf), Color(0xff2095f3)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    ),
    const LinearGradient(
      colors: [Color(0xffb1fff8), Color(0xff2095f3)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    ),
    const LinearGradient(
      colors: [Color(0xffa8b0e1), Color(0xff2095f3)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    ),
    const LinearGradient(
      colors: [Color(0xffdf9fea), Color(0xff2095f3)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    ),
    const LinearGradient(
      colors: [Color(0xfff9978f), Color(0xff2095f3)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    )
  ];
  final _random = Random();

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
                borderRadius:
                    BorderRadiusDirectional.circular(kSpacingUnit * 3),
                gradient: gradients[_random.nextInt(gradients.length)]),
            // decoration: BoxDecoration(
            //   color: Colors.white,
            //   borderRadius: BorderRadiusDirectional.circular(kSpacingUnit * 3),
            // ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.network(
                      data.company!.avatarImage!,
                      height: 30.sp,
                      width: 30.sp,
                    ),
                    SizedBox(width: kSpacingUnit),
                    Text(
                      data.company!.name!,
                      style:
                          kCardTitleTextStyle.copyWith(color: Colors.grey[800]),
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      'assets/icons/heart_icon.svg',
                      height: 20.sp,
                      width: 20.sp,
                      color: Colors.grey[800],
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  data.title!,
                  style: kSubTitleTextStyle,
                ),
                SizedBox(height: kSpacingUnit * 0.5),
                Text(
                  data.company!.country! + " " + data.company!.region!,
                  style: kCaptionTextStyle.copyWith(color: Colors.grey[800]),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
