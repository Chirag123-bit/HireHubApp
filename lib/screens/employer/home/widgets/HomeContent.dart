import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/dashboardJobModels/DashboardJob.dart';
import 'package:hirehub/repository/job_repository.dart';
import 'package:hirehub/response/jobResponse/dashboard_jobs_response.dart';
import 'package:intl/intl.dart';

class HomeContent extends StatefulWidget {
  Image logo;
  bool isLoading;
  HomeContent({
    Key? key,
    required this.logo,
    required this.isLoading,
  }) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
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
              SizedBox(height: kSpacingUnit * 2),
              FutureBuilder<DashboardJobsResponse?>(
                  future: JobsRepository().getDashboardJobs(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        List<DashboardJob> lstJobs = snapshot.data!.data!;
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: lstJobs.asMap().entries.map((item) {
                            final closeDate =
                                DateTime.parse(item.value.closeDate!);
                            final closeDateString =
                                DateFormat.MMMMEEEEd().format(closeDate);
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 5),
                              child: Container(
                                width: double.infinity,
                                height: 150,
                                padding: EdgeInsets.symmetric(
                                  horizontal: kSpacingUnit * 1.2,
                                  vertical: kSpacingUnit * 2,
                                ),
                                margin: EdgeInsets.symmetric(
                                    vertical: kSpacingUnit),
                                decoration: const BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        widget.isLoading
                                            ? const CircularProgressIndicator()
                                            : CircleAvatar(
                                                radius: kSpacingUnit * 2,
                                                backgroundImage:
                                                    widget.logo.image,
                                              ),
                                        SizedBox(width: kSpacingUnit * 1.2),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(item.value.title!,
                                                style: TextStyle(
                                                  fontSize: kSpacingUnit * 2,
                                                  fontWeight: FontWeight.bold,
                                                  color: Get.isDarkMode
                                                      ? Colors.white
                                                      : Colors.grey[600],
                                                )),
                                            Text("Kathamndu, Nepal",
                                                style: TextStyle(
                                                  fontSize: kSpacingUnit * 1.2,
                                                  color: Get.isDarkMode
                                                      ? Colors.white
                                                      : Colors.grey[600],
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text("Total:  ",
                                                style: TextStyle(
                                                  fontSize: kSpacingUnit * 1.5,
                                                  fontWeight: FontWeight.bold,
                                                  color: Get.isDarkMode
                                                      ? Colors.white
                                                      : Colors.grey[600],
                                                )),
                                            Text(
                                                item.value.applicants!.length
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: kSpacingUnit * 1.5,
                                                  color: Get.isDarkMode
                                                      ? Colors.white
                                                      : Colors.red[600],
                                                )),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("Apply By:  ",
                                                style: TextStyle(
                                                  fontSize: kSpacingUnit * 1.5,
                                                  fontWeight: FontWeight.bold,
                                                  color: Get.isDarkMode
                                                      ? Colors.white
                                                      : Colors.grey[600],
                                                )),
                                            Text(closeDateString,
                                                style: TextStyle(
                                                  fontSize: kSpacingUnit * 1.2,
                                                  color: Get.isDarkMode
                                                      ? Colors.white
                                                      : Colors.grey[600],
                                                )),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      } else {
                        return const Text("No Jobs Found");
                      }
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Column(
                        children: const [
                          CardLoading(
                            height: 100,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            margin: EdgeInsets.only(bottom: 10),
                          ),
                          CardLoading(
                            height: 50,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            margin: EdgeInsets.only(bottom: 10),
                          ),
                          CardLoading(
                            height: 100,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            margin: EdgeInsets.only(bottom: 10),
                          ),
                        ],
                      );
                    } else {
                      return const Text("Error retriving data");
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
