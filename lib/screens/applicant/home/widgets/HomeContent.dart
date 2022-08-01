import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/screens/applicant/category/CategoryScreen.dart';
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
          color: Get.isDarkMode ? Colors.grey[900] : kSilver,
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
                        color: Get.isDarkMode ? Colors.white : Colors.grey[600],
                      ),
                    ),
                    Text('View All',
                        style: kCardTitleTextStyle.copyWith(
                          color:
                              Get.isDarkMode ? Colors.white : Colors.grey[600],
                        )),
                  ],
                ),
              ),
              const HomePopularJobs(),
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
                        color: Get.isDarkMode ? Colors.white : Colors.grey[600],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.to(() => CategoryScreen()),
                      child: Text(
                        'View All',
                        style: kCardTitleTextStyle.copyWith(
                          color:
                              Get.isDarkMode ? Colors.white : Colors.grey[600],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const HomePopularCategories(),
              SizedBox(height: kSpacingUnit * 2),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kSpacingUnit * 4),
                child: Text(
                  'Recently Added',
                  style: kSubTitleTextStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Get.isDarkMode ? Colors.white : Colors.grey[600],
                  ),
                ),
              ),
              const HomeRecentJobs(),
            ],
          ),
        ),
      ),
    );
  }
}
