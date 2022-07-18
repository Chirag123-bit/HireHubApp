import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirehub/config/Constants.dart';

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
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Jobs',
                    style: kSubTitleTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Get.isDarkMode ? Colors.white : Colors.grey[600],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => {}),
                    child: Text(
                      'View All',
                      style: kCardTitleTextStyle.copyWith(
                        color: Get.isDarkMode ? Colors.white : Colors.grey[600],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
