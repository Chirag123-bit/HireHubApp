import 'dart:math';

import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hirehub/APIs/job_api.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/models/dashboardJobModels/DashboardJob.dart';
import 'package:hirehub/repository/job_repository.dart';
import 'package:hirehub/response/jobResponse/dashboard_jobs_response.dart';
import 'package:hirehub/response/jobResponse/job_status_change_response.dart';
import 'package:hirehub/utils/url.dart';

class ApplicantsOverview extends StatefulWidget {
  const ApplicantsOverview({Key? key}) : super(key: key);

  @override
  State<ApplicantsOverview> createState() => _ApplicantsOverviewState();
}

class _ApplicantsOverviewState extends State<ApplicantsOverview> {
  final _random = Random();

  static List<Color> sky = [const Color(0xFF6448FE), const Color(0xFF5FC6FF)];
  static List<Color> sunset = [
    const Color(0xFFFE6197),
    const Color(0xFFFFB463)
  ];
  static List<Color> sea = [const Color(0xFF61A3FE), const Color(0xFF63FFD5)];
  static List<Color> mango = [const Color(0xFFFFA738), const Color(0xFFFFE130)];
  static List<Color> fire = [const Color(0xFFFF5DCD), const Color(0xFFFF8484)];

  static List<List<Color>> grads = [sky, sunset, sea, mango, fire];

  List<Color> clrs = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.brown,
    Colors.grey,
    Colors.indigo,
    Colors.cyan,
    Colors.teal,
    Colors.lightGreen,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blueGrey,
    Colors.lightGreen,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blueGrey,
    Colors.lightGreen,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blueGrey,
    Colors.lightGreen,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blueGrey,
    Colors.lightGreen,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blueGrey,
    Colors.lightGreen,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blueGrey,
    Colors.lightGreen,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blueGrey,
    Colors.lightGreen,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blueGrey,
    Colors.lightGreen,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blueGrey,
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<DashboardJobsResponse?>(
                  future: JobsRepository().getDashboardJobs(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        List<DashboardJob> lstJobs = snapshot.data!.data!;
                        return Container(
                          margin:
                              EdgeInsets.symmetric(vertical: kSpacingUnit * 2),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: lstJobs
                                .asMap()
                                .entries
                                .map((jobs) => Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: kSpacingUnit * 2),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              " ${jobs.value.title}",
                                              style: TextStyle(
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.start,
                                            ),
                                            if (jobs.value.applicants!.isEmpty)
                                              Text(
                                                "No Applicants",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    fontSize: 10.sp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            else
                                              ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemCount: jobs
                                                    .value.applicants!.length,
                                                itemBuilder: (context, index) {
                                                  var profilePic = jobs
                                                      .value
                                                      .applicants![index]
                                                      .applicant!
                                                      .avatarImage;
                                                  if (profilePic!
                                                      .contains("uploads\\")) {
                                                    profilePic =
                                                        baseImgUrl + profilePic;
                                                    profilePic = profilePic
                                                        .replaceAll("\\", "/");
                                                  }
                                                  return Container(
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 10,
                                                        horizontal: 5),
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                          colors: grads[_random
                                                              .nextInt(grads
                                                                  .length)],
                                                          begin: Alignment
                                                              .centerLeft,
                                                          end: Alignment
                                                              .centerRight),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              kSpacingUnit * 3),
                                                    ),
                                                    child: ListTile(
                                                      style: ListTileStyle.list,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                kSpacingUnit *
                                                                    2),
                                                      ),
                                                      leading: CircleAvatar(
                                                        backgroundImage:
                                                            NetworkImage(
                                                                profilePic),
                                                        radius:
                                                            kSpacingUnit * 2,
                                                      ),
                                                      title: Text(
                                                        jobs
                                                                .value
                                                                .applicants![
                                                                    index]
                                                                .applicant!
                                                                .firstName! +
                                                            " " +
                                                            jobs
                                                                .value
                                                                .applicants![
                                                                    index]
                                                                .applicant!
                                                                .lastName!,
                                                        style: TextStyle(
                                                            fontSize:
                                                                kSpacingUnit *
                                                                    2),
                                                      ),
                                                      subtitle: Text(
                                                        jobs
                                                            .value
                                                            .applicants![index]
                                                            .status!,
                                                        style: TextStyle(
                                                            fontSize:
                                                                kSpacingUnit *
                                                                    1.5),
                                                      ),
                                                      trailing: GestureDetector(
                                                        onTap: () {
                                                          showModalBottomSheet(
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            context: context,
                                                            isScrollControlled:
                                                                true,
                                                            builder: (context) => ApplicantProfileSheet(
                                                                user: jobs
                                                                    .value
                                                                    .applicants![
                                                                        index]
                                                                    .applicant!,
                                                                job: jobs.value,
                                                                clrs: clrs,
                                                                profilePic:
                                                                    profilePic!,
                                                                currentStatus: jobs
                                                                    .value
                                                                    .applicants![
                                                                        index]
                                                                    .status!,
                                                                jobId: jobs
                                                                    .value.id!,
                                                                index: index),
                                                          );
                                                        },
                                                        child: const Icon(
                                                          Icons
                                                              .remove_red_eye_outlined,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                          ],
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
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
                  })
            ],
          ),
        )),
      ),
    );
  }

  Widget ApplicantProfileSheet({
    required User user,
    required DashboardJob job,
    required List<Color> clrs,
    required String profilePic,
    required String currentStatus,
    required String jobId,
    required int index,
  }) {
    String defaultSummary =
        "Sure, so, my name is Joe and I am 27 years old.For the past 5 years, Ive been working as a business analyst at Company X and Y.I have some background in data analysis, with a degree from University XY. What really got me into the field, though, is the internship I did at Company Z. Throughout my career, I’ve noticed that I’ve always been good with numbers and handling data.For example, when I was working at Company X, I led a project for migrating all operations data to a new data warehousing system to cut down on costs. The new solution was a much better fit for our business, which eventually led to savings of up to 200,000 annually. Moving forward, I hope to expand my experience across different industries. Particularly fintech, which is why I am interested in your company";
    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      builder: (_, controller) => Container(
        color: Get.theme.canvasColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PopupMenuButton<String>(
                    onSelected: (value) => onStatusChange(context, value,
                        user.id!, currentStatus, jobId, job, index),
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: "New",
                        child: Text("New"),
                      ),
                      const PopupMenuItem(
                        value: "Interview",
                        child: Text("Interview"),
                      ),
                      const PopupMenuItem(
                        value: "Negotiation",
                        child: Text("Negotiation"),
                      ),
                      const PopupMenuItem(
                        value: "Shortlist",
                        child: Text("Shortlist"),
                      ),
                      const PopupMenuItem(
                        value: "Task Phase",
                        child: Text("Task Phase"),
                      ),
                      const PopupMenuItem(
                        value: "Hired",
                        child: Text("Hired"),
                      ),
                      const PopupMenuItem(
                        value: "Rejected",
                        child: Text("Rejected"),
                      ),
                      const PopupMenuItem(
                        value: "Disqualified",
                        child: Text("Disqualified"),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: kSpacingUnit * 2),
              CircleAvatar(
                radius: kSpacingUnit * 5,
                backgroundImage: NetworkImage(profilePic),
              ),
              Text(
                user.firstName! + " " + user.lastName!,
                style: TextStyle(fontSize: kSpacingUnit * 3),
              ),
              Text(
                user.email!,
                style: TextStyle(fontSize: kSpacingUnit * 2),
              ),
              Text(
                user.phone!,
                style: TextStyle(fontSize: kSpacingUnit * 2),
              ),
              SizedBox(height: kSpacingUnit * 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Wrap(
                    spacing: kSpacingUnit * 2,
                    runSpacing: kSpacingUnit * 2,
                    children: user.skills!.map((skill) {
                      return Chip(
                        label: Text(skill),
                        backgroundColor: clrs[_random.nextInt(clrs.length)],
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(height: kSpacingUnit * 2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About:",
                    style: TextStyle(fontSize: kSpacingUnit * 1.8),
                  ),
                  // SizedBox(),
                  Container(
                    child: Text(
                      user.summary ?? defaultSummary,
                      style: TextStyle(fontSize: kSpacingUnit * 1.5),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 20,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
              SizedBox(height: kSpacingUnit * 2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Educational Records:",
                    style: TextStyle(fontSize: kSpacingUnit * 1.8),
                  ),
                  // SizedBox(),
                  //show education records

                  for (var education in user.educationSet!)
                    ListTile(
                      tileColor: clrs[_random.nextInt(clrs.length)],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kSpacingUnit * 2),
                      ),
                      leading: CircleAvatar(
                        child: Text(education.degree![0].toUpperCase()),
                        backgroundColor: clrs[_random.nextInt(clrs.length)],
                        foregroundColor: Colors.white,
                        radius: kSpacingUnit * 2,
                      ),
                      title: Text(
                        education.degree!,
                        style: TextStyle(fontSize: kSpacingUnit * 2),
                      ),
                      subtitle: Text(
                        education.college!,
                        style: TextStyle(fontSize: kSpacingUnit * 1.5),
                      ),
                    ),
                ],
              ),
              SizedBox(height: kSpacingUnit * 2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Employment Records:",
                    style: TextStyle(fontSize: kSpacingUnit * 1.8),
                  ),
                  for (var work in user.workSet!)
                    ListTile(
                      tileColor: clrs[_random.nextInt(clrs.length)],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kSpacingUnit * 2),
                      ),
                      leading: CircleAvatar(
                        child: Text(work.job_title![0].toUpperCase()),
                        backgroundColor: clrs[_random.nextInt(clrs.length)],
                        foregroundColor: Colors.white,
                        radius: kSpacingUnit * 2,
                      ),
                      title: Text(
                        work.job_title!,
                        style: TextStyle(fontSize: kSpacingUnit * 2),
                      ),
                      subtitle: Text(
                        work.company!,
                        style: TextStyle(fontSize: kSpacingUnit * 1.5),
                      ),
                      // trailing: Text(
                      //   work.startDate!.toString() +
                      //       " - " +
                      //       work.endDate!.toString(),
                      //   style: TextStyle(fontSize: kSpacingUnit * 1.5),
                      // ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onStatusChange(
    BuildContext context,
    String status,
    String userId,
    String currentStatus,
    String jobId,
    DashboardJob job,
    int index,
  ) {
    JobsAPI jobApi = JobsAPI();

    if (status == currentStatus) {
      return;
    } else {
      Get.dialog(
        AlertDialog(
          title: const Text("Change Status"),
          content: Text(
              "Are you sure you want to place the applicant to the $status stage?"),
          actions: [
            FlatButton(
              child: const Text("Yes"),
              onPressed: () async {
                Get.back();
                JobsStatusChangeResponse? resp =
                    await jobApi.changeStatus(userId, jobId, status);
                if (resp != null) {
                  if (resp.success!) {
                    setState(() {
                      job.applicants![index].status = status;
                    });

                    Get.snackbar(
                      "Success",
                      "Status Updated successfully",
                      icon: const Icon(Icons.check, color: Colors.white),
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                    );
                  } else {
                    Get.snackbar(
                      "Error",
                      "Failed to update status",
                      icon: const Icon(Icons.error, color: Colors.white),
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                } else {
                  Get.snackbar(
                    "Failed",
                    "Failed to update status",
                    icon: const Icon(Icons.error, color: Colors.white),
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                }
                // changeStatus(jonId, userId, status);
              },
            ),
            FlatButton(
              child: const Text("No"),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      );
    }
  }
}
