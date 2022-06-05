import 'package:flutter/material.dart';
import 'package:hirehub/models/Job.dart';
import 'package:hirehub/screens/applicant/home/widgets/LatestJobContainer.dart';

class LatestJobs extends StatelessWidget {
  LatestJobs({Key? key}) : super(key: key);

  final jobList = Job.generatedJobs();

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      child: Expanded(
          child: ListView.builder(
        itemCount: jobList.length,
        itemBuilder: (context, index) {
          return LatestJobContainer(jobList[index]);
        },
      )),
    );
  }
}
