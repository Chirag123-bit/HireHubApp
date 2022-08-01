import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/dashboardJobModels/DashboardJob.dart';
import 'package:hirehub/screens/employer/home/job_details/DetailScreen.dart';
import 'package:number_to_words/number_to_words.dart';

// ignore: must_be_immutable
class EmployerJobCard extends StatefulWidget {
  Image logo;
  bool isLoading;
  final String closeDateString;
  final DashboardJob item;
  Function needRefresh;
  List<Color> color;

  EmployerJobCard({
    Key? key,
    required this.closeDateString,
    required this.isLoading,
    required this.item,
    required this.logo,
    required this.needRefresh,
    required this.color,
  }) : super(key: key);

  @override
  State<EmployerJobCard> createState() => _EmployerJobCardState();
}

class _EmployerJobCardState extends State<EmployerJobCard> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

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
          return JobDetailScreen(
              data: widget.item, needRefresh: widget.needRefresh);
        },
        closedColor: Colors.transparent,
        closedElevation: 0,
        closedBuilder: (context, action) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
            child: Container(
              width: double.infinity,
              height: 125.sp,
              padding: EdgeInsets.symmetric(
                horizontal: kSpacingUnit * 1.2,
                vertical: kSpacingUnit * 2,
              ),
              margin: EdgeInsets.symmetric(vertical: kSpacingUnit),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: widget.color,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      widget.isLoading
                          ? const CircularProgressIndicator()
                          : CircleAvatar(
                              radius: kSpacingUnit * 2,
                              backgroundImage: widget.logo.image,
                            ),
                      SizedBox(width: kSpacingUnit * 1.2),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.item.title!,
                              style: TextStyle(
                                fontSize: kSpacingUnit * 2,
                                fontWeight: FontWeight.bold,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.white,
                              )),
                          Text("Kathamndu, Nepal",
                              style: TextStyle(
                                fontSize: kSpacingUnit * 1.2,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.white,
                              )),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("Applicants",
                              style: TextStyle(
                                fontSize: kSpacingUnit * 1.5,
                                fontWeight: FontWeight.bold,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.white,
                              )),
                          Text(
                              widget.item.applicants!.isNotEmpty
                                  ? NumberToWord()
                                      .convert('en-in',
                                          widget.item.applicants!.length)
                                      .toUpperCase()
                                  : "No Applicants",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: kSpacingUnit * 1.5,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.white,
                              )),
                        ],
                      ),
                      Column(
                        children: [
                          Text("Deadline",
                              style: TextStyle(
                                fontSize: kSpacingUnit * 1.5,
                                fontWeight: FontWeight.bold,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.white,
                              )),
                          Text(widget.closeDateString,
                              style: TextStyle(
                                fontSize: kSpacingUnit * 1.5,
                                fontWeight: FontWeight.w600,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.white,
                              )),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
