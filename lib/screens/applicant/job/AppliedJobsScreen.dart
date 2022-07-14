import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirehub/controller/AppliedJobController.dart';
import 'package:hirehub/models/jobModels/AppliedJobs.dart';
import 'package:intl/intl.dart';

class AppliedJobScreen extends StatefulWidget {
  const AppliedJobScreen({Key? key}) : super(key: key);

  @override
  State<AppliedJobScreen> createState() => _AppliedJobScreenState();
}

class _AppliedJobScreenState extends State<AppliedJobScreen> {
  final appliedJobsController = Get.put(JobController());
  bool isLoading = true;

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    super.initState();
    appliedJobsController.getAppliedJobs();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                // bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              color: Color(0xff363f93),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 100,
                  left: 0,
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),
                const Positioned(
                  top: 113,
                  left: 20,
                  child: Text(
                    "Applied Jobs",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff363f93),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: isLoading
                ? const CircularProgressIndicator()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Obx(() {
                      return ListView.builder(
                        itemCount: appliedJobsController.appliedJobsList.length,
                        itemBuilder: (_, index) {
                          return AppliedCard(
                            appliedJob:
                                appliedJobsController.appliedJobsList[index],
                            index: index,
                          );
                        },
                      );
                    }),
                  ),
          )
        ],
      ),
    );
  }
}

class AppliedCard extends StatelessWidget {
  final AppliedJob appliedJob;
  final int index;
  const AppliedCard({
    Key? key,
    required this.appliedJob,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appliedDate = DateTime.parse(appliedJob.appliedDate!);
    final appliedDateString = DateFormat.MMMMEEEEd().format(appliedDate);
    final pos = index % 2 == 0 ? 'left' : 'right';

    return Container(
      height: 150,
      margin: const EdgeInsets.only(top: 0, bottom: 10),
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      decoration: BoxDecoration(
        color: const Color(0xff363f93),
        borderRadius: pos == 'left'
            ? const BorderRadius.only(
                bottomLeft: Radius.circular(80),
              )
            : const BorderRadius.only(
                topRight: Radius.circular(80),
              ),
        // const BorderRadius.only(
        //   pos=='left'?Radius.circular(20):Radius.circular(0),
        //   // topLeft: Radius.circular(80),
        // ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff363f93).withOpacity(0.3),
            offset: const Offset(-10, 0),
            blurRadius: 20,
            spreadRadius: 4,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 38,
          top: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              appliedJob.companyName!,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            Text(
              appliedJob.title!,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              appliedJob.companyRegion! + ", " + appliedJob.companyCountry!,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Row(
                  children: [
                    const Text(
                      "Applied on: ",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      appliedDateString,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    const Text(
                      "Status: ",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      appliedJob.status!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
