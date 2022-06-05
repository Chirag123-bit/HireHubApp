import 'package:flutter/material.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/Job.dart';

class LatestJobs extends StatelessWidget {
  LatestJobs({Key? key}) : super(key: key);

  final jobList = Job.generatedJobs();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: jobList.length,
      itemBuilder: (context, index) {
        return LatestJobContainer(jobList[index]);
      },
    ));
  }
}

class LatestJobContainer extends StatelessWidget {
  final Job job;

  const LatestJobContainer(this.job);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
          padding: const EdgeInsets.all(28),
          child: Row(
            children: [
              Image(
                image: AssetImage(job.logoUrl),
                width: 50,
                height: 50,
              ),
              Column(children: [
                Text(
                  job.title,
                  style: kBoldStyle.copyWith(fontSize: 17),
                ),
                Text(
                  job.company,
                  style: kBoldStyle.copyWith(fontSize: 17, color: Colors.grey),
                ),
              ])
            ],
          )),
    );
  }
}
