// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirehub/APIs/job_api.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/models/dashboardJobModels/DashboardJob.dart';
import 'package:hirehub/response/jobResponse/job_status_change_response.dart';
import 'package:hirehub/utils/url.dart';

class ApplicantListScreen extends StatefulWidget {
  DashboardJob data;
  Function needRefresh;
  ApplicantListScreen({Key? key, required this.data, required this.needRefresh})
      : super(key: key);

  @override
  State<ApplicantListScreen> createState() => _ApplicantListScreenState();
}

class _ApplicantListScreenState extends State<ApplicantListScreen> {
  final _random = Random();
  int New = 0;
  int Interview = 0;
  int Negotiation = 0;
  int Shortlist = 0;
  int Task_Phase = 0;
  int Hired = 0;
  int Rejected = 0;
  int Disqualified = 0;

  void updateData() {
    setState(() {
      New = 0;
      Interview = 0;
      Negotiation = 0;
      Shortlist = 0;
      Task_Phase = 0;
      Hired = 0;
      Rejected = 0;
      Disqualified = 0;
    });
    for (var element in widget.data.applicants!) {
      if (element.status == 'New') {
        New++;
      } else if (element.status == 'Interview') {
        Interview++;
      } else if (element.status == 'Negotiation') {
        Negotiation++;
      } else if (element.status == 'Shortlist') {
        Shortlist++;
      } else if (element.status == 'Task Phase') {
        Task_Phase++;
      } else if (element.status == 'Hired') {
        Hired++;
      } else if (element.status == 'Rejected') {
        Rejected++;
      } else if (element.status == 'Disqualified') {
        Disqualified++;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    updateData();
  }

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
    return Scaffold(
      appBar: AppBar(
          title: Text(
        widget.data.title!,
        style: TextStyle(fontSize: kSpacingUnit * 3),
      )),
      body: Column(
        children: [
          SizedBox(height: kSpacingUnit * 5),
          Text(
            "Applicant Status",
            style: TextStyle(fontSize: kSpacingUnit * 2.5),
          ),
          SizedBox(height: kSpacingUnit),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                buildCard("New", New),
                SizedBox(width: kSpacingUnit * 2),
                buildCard("Interview", Interview),
                SizedBox(width: kSpacingUnit * 2),
                buildCard("Negotiation", Negotiation),
                SizedBox(width: kSpacingUnit * 2),
                buildCard("Shortlist", Shortlist),
                SizedBox(width: kSpacingUnit * 2),
                buildCard("Task Phase", Task_Phase),
                SizedBox(width: kSpacingUnit * 2),
                buildCard("Hired", Hired),
                SizedBox(width: kSpacingUnit * 2),
                buildCard("Rejected", Rejected),
                SizedBox(width: kSpacingUnit * 2),
                buildCard("Disqualified", Disqualified),
              ],
            ),
          ),
          SizedBox(height: kSpacingUnit * 4),
          Text(
            "Applicant List",
            style: TextStyle(fontSize: kSpacingUnit * 2.5),
          ),
          SizedBox(height: kSpacingUnit),
          Expanded(
            child: ListView.builder(
                itemCount: widget.data.applicants!.length,
                itemBuilder: ((context, index) {
                  var profilePic =
                      widget.data.applicants![index].applicant!.avatarImage;
                  if (profilePic!.contains("uploads\\")) {
                    profilePic = baseImgUrl + profilePic;
                    profilePic = profilePic.replaceAll("\\", "/");
                  }
                  return Container(
                    margin: EdgeInsets.symmetric(
                        // horizontal: kSpacingUnit * 2,
                        vertical: kSpacingUnit * 2),
                    child: ListTile(
                      // horizontalTitleGap: 20,
                      tileColor: clrs[_random.nextInt(clrs.length)],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kSpacingUnit * 2),
                      ),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(profilePic),
                        radius: kSpacingUnit * 2,
                      ),
                      title: Text(
                        widget.data.applicants![index].applicant!.firstName! +
                            " " +
                            widget.data.applicants![index].applicant!.lastName!,
                        style: TextStyle(fontSize: kSpacingUnit * 2),
                      ),
                      subtitle: Text(
                        widget.data.applicants![index].status!,
                        style: TextStyle(fontSize: kSpacingUnit * 1.5),
                      ),
                      trailing: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            isScrollControlled: true,
                            builder: (context) => ApplicantProfileSheet(
                                user: widget.data.applicants![index].applicant!,
                                job: widget.data,
                                clrs: clrs,
                                profilePic: profilePic!,
                                currentStatus:
                                    widget.data.applicants![index].status!,
                                needRefresh: widget.needRefresh,
                                index: index),
                          );
                        },
                        child: const Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                })),
          ),
        ],
      ),
    );
  }

  Widget buildCard(String status, int count) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: grads[_random.nextInt(grads.length)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          "$status \n ${count.toString()}",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: kSpacingUnit * 2,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget ApplicantProfileSheet(
      {required User user,
      required DashboardJob job,
      required List<Color> clrs,
      required String profilePic,
      required String currentStatus,
      required Function needRefresh,
      required int index}) {
    String defaultSummary =
        "Sure, so, my name is Joe and I am 27 years old.For the past 5 years, Ive been working as a business analyst at Company X and Y.I have some background in data analysis, with a degree from University XY. What really got me into the field, though, is the internship I did at Company Z. Throughout my career, I’ve noticed that I’ve always been good with numbers and handling data.For example, when I was working at Company X, I led a project for migrating all operations data to a new data warehousing system to cut down on costs. The new solution was a much better fit for our business, which eventually led to savings of up to 200,000 annually. Moving forward, I hope to expand my experience across different industries. Particularly fintech, which is why I am interested in your company";
    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      builder: (_, controller) => Container(
        color: Get.theme.canvasColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PopupMenuButton<String>(
                    onSelected: (value) => onStatusChange(
                        context, value, user.id!, currentStatus, index),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Wrap(
                      spacing: kSpacingUnit * 2,
                      runSpacing: kSpacingUnit * 2,
                      children: user.skills!.map((skill) {
                        return Chip(
                          label: Text(
                            skill,
                            style: const TextStyle(color: Colors.white),
                          ),
                          backgroundColor: clrs[_random.nextInt(clrs.length)],
                        );
                      }).toList(),
                    ),
                  ],
                ),
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

  void onStatusChange(BuildContext context, String status, String userId,
      String currentStatus, int index) {
    String jobId = widget.data.id!;
    JobsAPI jobApi = JobsAPI();

    if (status == currentStatus) {
      return;
    } else {
      print("changing status");
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
                      widget.needRefresh();
                      widget.data.applicants![index].status = status;
                      updateData();
                    });
                    Get.back();
                    Get.snackbar(
                      "Success",
                      "Status Updated successfully",
                      icon: const Icon(Icons.check, color: Colors.white),
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                    );
                    // Get.reload();
                  } else {
                    Get.snackbar("Error", "Failed to update status");
                  }
                } else {
                  Get.snackbar("Failed", "Failed to update status");
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
