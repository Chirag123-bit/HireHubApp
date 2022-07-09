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
  JobsRepository repo = JobsRepository();
  AppliedJob? appliedJob;

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
    super.initState();
    getAppliedJobs();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: EdgeInsets.all(kSpacingUnit * 2),
        decoration: BoxDecoration(
          color: Colors.white,
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
                    height: kSpacingUnit * 6,
                    width: kSpacingUnit * 8,
                    decoration: BoxDecoration(
                      color: kSilverColor,
                      borderRadius: BorderRadius.circular(kSpacingUnit * 3),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/heart_icon.svg',
                        height: 20.sp,
                        width: 20.sp,
                        color: kAccentColor,
                      ),
                    ),
                  ),
                  SizedBox(width: kSpacingUnit * 2),
                  Expanded(
                    child: Container(
                      height: kSpacingUnit * 6,
                      decoration: BoxDecoration(
                        color: kAccentColor,
                        borderRadius: BorderRadius.circular(kSpacingUnit * 3),
                      ),
                      child: isvalidating
                          ? const CircularProgressIndicator()
                          : GestureDetector(
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
}
