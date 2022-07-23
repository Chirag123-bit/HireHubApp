import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/dashboardJobModels/DashboardJob.dart';
import 'package:hirehub/screens/applicant/home/widgets/DetailItem.dart';

class DetailContent extends StatelessWidget {
  const DetailContent({
    Key? key,
    required this.data,
  }) : super(key: key);

  final DashboardJob data;

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
              SizedBox(height: kSpacingUnit * 3),
              Center(
                child: Column(
                  children: [
                    Text(
                      data.title!,
                      style: kTitleTextStyle.copyWith(
                        color: Get.isDarkMode ? Colors.white : Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: kSpacingUnit),
                    Text(
                      "Kathmandu, Nepal",
                      style: kCaptionTextStyle.copyWith(
                          fontSize: 16,
                          color:
                              Get.isDarkMode ? Colors.white : Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: kSpacingUnit * 3),
              SizedBox(
                height: 60,
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
                            fontSize: 15,
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        Text(data.sallary.toString() + " /month",
                            style: kCaptionTextStyle.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
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
                            fontSize: 15,
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        Text("Full Time",
                            style: kCaptionTextStyle.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
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
                style: kSubTitleTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: kSpacingUnit * 1.5),
              Text(
                data.about!,
                textAlign: TextAlign.justify,
                style: kCaptionTextStyle.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
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
                  fontSize: 20,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: kSpacingUnit * 1.5),
              Text(
                data.description!,
                textAlign: TextAlign.justify,
                style: kCaptionTextStyle.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
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
                  fontSize: 20,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: kSpacingUnit),
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
              SizedBox(height: kSpacingUnit),
              ...data.requirements!
                  .map((qualification) => DetailItem(data: qualification))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
