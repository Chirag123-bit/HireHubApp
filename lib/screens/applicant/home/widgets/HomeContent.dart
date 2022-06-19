import 'package:flutter/material.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/screens/applicant/home/widgets/HomeCategoryCard.dart';
import 'package:hirehub/screens/applicant/home/widgets/HomePopularJobs.dart';
import 'package:hirehub/screens/applicant/home/widgets/HomeRecentJobs.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          color: kSilverColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(kSpacingUnit * 5),
            topRight: Radius.circular(kSpacingUnit * 5),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: kSpacingUnit * 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kSpacingUnit * 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recommended Jobs',
                      style: kSubTitleTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text('View All', style: kCardTitleTextStyle),
                  ],
                ),
              ),
              HomePopularJobs(),
              SizedBox(height: kSpacingUnit * 2),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kSpacingUnit * 4),
                child: Text(
                  'Recently Added',
                  style: kSubTitleTextStyle.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const HomeRecentJobs(),
              SizedBox(height: kSpacingUnit * 2),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kSpacingUnit * 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Categories',
                      style: kSubTitleTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text('View All', style: kCardTitleTextStyle),
                  ],
                ),
              ),
              const HomePopularCategories(),
            ],
          ),
        ),
      ),
    );
  }
}
