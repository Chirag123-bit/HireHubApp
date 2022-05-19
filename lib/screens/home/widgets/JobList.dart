import 'package:flutter/material.dart';
import 'package:hirehub/models/Job.dart';
import 'package:hirehub/screens/home/widgets/JobItem.dart';

class JobList extends StatelessWidget {
  final jobList = Job.generatedJobs();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 160,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        itemBuilder: ((context, index) => JobItem(
              jobList[index],
            )),
        separatorBuilder: (_, index) => const SizedBox(
          width: 15,
        ),
        itemCount: jobList.length,
      ),
    );
  }
}
