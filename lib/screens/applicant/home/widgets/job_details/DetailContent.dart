import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/Job.dart';
import 'package:hirehub/screens/applicant/home/widgets/DetailItem.dart';
import 'package:hirehub/utils/url.dart';

class DetailContent extends StatelessWidget {
  const DetailContent({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Job data;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    var logo = data.company!.avatarImage;
    if (logo!.contains("uploads\\")) {
      logo = baseImgUrl + logo;
      logo = logo.replaceAll("\\", "/");
    }
    return Flexible(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: kSpacingUnit * 2,
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
              SizedBox(height: kSpacingUnit * 2.5),
              Center(
                child: Column(
                  children: [
                    Image.network(
                      logo,
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
                          color:
                              Get.isDarkMode ? Colors.white : Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: kSpacingUnit * 3),
              SizedBox(
                height: 80,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Sallary",
                          style: kSubTitleTextStyle.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        Text(data.sallary.toString() + " /month",
                            style: kCaptionTextStyle.copyWith(
                              fontWeight: FontWeight.w400,

                              //increase line spacing
                              height: 1.3,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                            ))
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Type",
                          style: kSubTitleTextStyle.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        Text("Full Time",
                            style: kCaptionTextStyle.copyWith(
                              fontWeight: FontWeight.w400,

                              //increase line spacing
                              height: 1.3,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: kSpacingUnit),
              Text(
                'About this job',
                style: kTitleTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  // fontSize: 20,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: kSpacingUnit * 1.5),
              Text(
                data.about!,
                textAlign: TextAlign.justify,
                style: kCaptionTextStyle.copyWith(
                  fontWeight: FontWeight.w400,
                  // fontSize: 13,
                  //increase line spacing
                  height: 1.3,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: kSpacingUnit * 3),
              Text(
                'Job Description',
                style: kSubTitleTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  // fontSize: 20,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: kSpacingUnit * 1.5),
              Text(
                data.description!,
                textAlign: TextAlign.justify,
                style: kCaptionTextStyle.copyWith(
                  fontWeight: FontWeight.w400,
                  // fontSize: 13,
                  //increase line spacing
                  height: 1.3,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: kSpacingUnit * 3),
              Text(
                'Responsibilities',
                style: kSubTitleTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  // fontSize: 20,
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
                  // fontSize: 20,
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
