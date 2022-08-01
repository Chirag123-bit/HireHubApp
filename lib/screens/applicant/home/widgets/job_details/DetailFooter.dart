import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/controller/AppliedJobController.dart';
import 'package:hirehub/models/Job.dart';
import 'package:hirehub/models/jobModels/AppliedJobs.dart';
import 'package:hirehub/repository/job_repository.dart';
import 'package:intl/intl.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:sensors_plus/sensors_plus.dart';

class DetailFooter extends StatefulWidget {
  final Job data;
  const DetailFooter({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<DetailFooter> createState() => _DetailFooterState();
}

class _DetailFooterState extends State<DetailFooter> {
  bool isLoading = false;

  bool isApplied = false;
  bool isSaved = false;
  bool isvalidating = false;
  bool issth = false;
  JobsRepository repo = JobsRepository();
  AppliedJob? appliedJob;
  List<double> accelerometerValues = <double>[];
  final List<StreamSubscription<dynamic>> _streamSubscriptions =
      <StreamSubscription<dynamic>>[];

  final JobController _jobController = Get.put(JobController());
  getAppliedJobs() async {
    setState(() {
      isvalidating = true;
    });
    final appliedJobs = _jobController.appliedJobsList;
    _jobController.getAppliedJobs();
    for (var data in appliedJobs) {
      if (widget.data.id == data.id) {
        setState(() {
          isApplied = true;
          appliedJob = data;
        });
        break;
      }
    }
    setState(() {
      isvalidating = false;
    });
  }

  void applyForJob() {
    setState(() {
      isLoading = true;
    });
    repo.applyForJob(widget.data.id!).then((value) {
      if (value != null && value == true) {
        MotionToast.success(
          description: const Text("Successfully applied for the job"),
        ).show(context);
      } else {
        MotionToast.error(
          description: const Text("Error applying for job"),
        ).show(context);
      }
    });
    setState(() {
      isApplied = true;
    });
    if (isApplied) {
      appliedJob = AppliedJob(
        id: widget.data.id,
        title: widget.data.title,
        companyName: widget.data.company!.name,
        companyCountry: widget.data.company!.country,
        companyRegion: widget.data.company!.region,
        status: "New",
        appliedDate: DateTime.now().toString(),
      );
      _jobController.addAppliedJob(appliedJob: appliedJob);
    }
    setState(() {
      isApplied = true;
    });
    Get.reload();
  }

  @override
  void initState() {
    // TODO: implement initState
    getAppliedJobs();

    super.initState();

    checkMotion();
  }

  void checkMotion() {
    _streamSubscriptions.add(
      userAccelerometerEvents.listen((UserAccelerometerEvent event) async {
        if (event.x > 4 || event.x < -4 && event.y > 2 || event.y < -2) {
          setState(() {
            issth = true;
          });
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: EdgeInsets.all(kSpacingUnit),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: [kFooterShadow],
        ),
        child: Row(
          children: isApplied
              ? [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Applied On:",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              DateFormat.MMMMEEEEd().format(
                                  DateTime.parse(appliedJob!.appliedDate!)),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Application Status:",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "${appliedJob?.status}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ]
              : [
                  Container(
                    height: kSpacingUnit * 3,
                    width: kSpacingUnit * 4,
                    decoration: BoxDecoration(
                      color: Get.isDarkMode ? Colors.black : kSilverColor,
                      borderRadius: BorderRadius.circular(kSpacingUnit * 1.5),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/heart_icon.svg',
                        height: 15.sp,
                        width: 15.sp,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(width: kSpacingUnit * 2),
                  Expanded(
                    child: Container(
                      height: kSpacingUnit * 4,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(kSpacingUnit * 3),
                      ),
                      child: issth
                          ? Center(
                              child: Text(
                                'Blocked',
                                style: kTitleTextStyle.copyWith(
                                  color: Colors.red,
                                ),
                              ),
                            )
                          : isvalidating
                              ? const CircularProgressIndicator()
                              : GestureDetector(
                                  key: const Key("applyKey"),
                                  onTap: isLoading ? () {} : applyForJob,
                                  child: isLoading
                                      ? const CircularProgressIndicator()
                                      : Center(
                                          child: Text(
                                            'Apply Now',
                                            style: kTitleTextStyle.copyWith(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                ),
                    ),
                  ),
                ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (final subscription in _streamSubscriptions) {
      subscription.cancel();
    }
    super.dispose();
  }
}
