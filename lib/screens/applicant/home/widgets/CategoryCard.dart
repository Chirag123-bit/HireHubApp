import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/Category.dart';

class CategoryCard extends StatelessWidget {
  final Category data;

  const CategoryCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(boxShadow: [kCardShadow], color: Colors.transparent),
      child: OpenContainer(
        transitionType: ContainerTransitionType.fade,
        transitionDuration: const Duration(milliseconds: 500),
        openColor: kSilverColor,
        openElevation: 0,
        openBuilder: (context, action) {
          return const Text("");
          // return DetailScreen(data: data);
        },
        closedColor: Colors.transparent,
        closedElevation: 0,
        closedBuilder: (context, action) {
          return Container(
            height: 104.w,
            padding: EdgeInsets.symmetric(
                horizontal: kSpacingUnit * 4, vertical: kSpacingUnit * 1),
            decoration: BoxDecoration(
              color: data.background!,
              borderRadius: BorderRadiusDirectional.circular(kSpacingUnit * 3),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      data.image!,
                      height: 60.sp,
                      width: 60.sp,
                    ),
                    SizedBox(width: kSpacingUnit),
                    Center(
                      child: Text(
                        data.title!,
                        style: kCardTitleTextStyle.copyWith(
                            fontSize: 22, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Text(
                    data.subtitle!,
                    style: kSubTitleTextStyle.copyWith(
                        color: Colors.black, fontSize: 18),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
