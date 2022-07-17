import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/Job.dart';
import 'package:hirehub/screens/applicant/home/widgets/DetailItem.dart';

class DetailContent extends StatelessWidget {
  const DetailContent({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Job data;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: kSpacingUnit * 4,
        ),
        decoration: BoxDecoration(
          color: Get.isDarkMode ? Colors.grey[900] : Colors.white,
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
              Center(
                child: Column(
                  children: [
                    Image.network(
                      data.company!.avatarImage!,
                      height: 55.sp,
                      width: 55.sp,
                    ),
                    SizedBox(height: kSpacingUnit * 2),
                    Text(
                      data.company!.name!,
                      style: kTitleTextStyle.copyWith(
                        color: Get.isDarkMode ? Colors.white : Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: kSpacingUnit),
                    Text(
                      data.company!.country! + ", " + data.company!.region!,
                      style: kCaptionTextStyle.copyWith(
                          fontSize: 16,
                          color:
                              Get.isDarkMode ? Colors.white : Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: kSpacingUnit * 5),
              Text(
                'Responsibilities',
                style: kSubTitleTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: kSpacingUnit * 2),
              ...data.responsibilities!
                  .map((responsibility) => DetailItem(data: responsibility))
                  .toList(),
              SizedBox(height: kSpacingUnit),
              Text(
                'Qualifications',
                style: kSubTitleTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: kSpacingUnit * 2),
              ...data.requirements!
                  .map((qualification) => DetailItem(data: qualification))
                  .toList(),
              SizedBox(height: kSpacingUnit * 15),
            ],
          ),
        ),
      ),
    );
  }
}
