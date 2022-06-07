import 'package:flutter/material.dart';
import 'package:hirehub/models/Job.dart';
import 'package:hirehub/screens/applicant/home/widgets/LatestJobContainer.dart';
import 'package:hirehub/screens/applicant/job/JobDetails.dart';

class LatestJobs extends StatelessWidget {
  LatestJobs({Key? key}) : super(key: key);

  final jobList = Job.generatedJobs();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: jobList.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JobDetails(job: jobList[index]),
                  ),
                );
              },
              child: LatestJobContainer(jobList[index]));
          // return LatestJobContainer(jobList[index]);
        },
      ),
    );
  }
}
