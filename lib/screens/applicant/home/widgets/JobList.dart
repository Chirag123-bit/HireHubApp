import 'package:flutter/material.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/Job.dart';
import 'package:hirehub/screens/applicant/home/widgets/JobItem.dart';

class JobList extends StatefulWidget {
  @override
  State<JobList> createState() => _JobListState();
}

class _JobListState extends State<JobList> {
  final jobList = Job.generatedJobs();

  late PageController controller;
  int currentIndex = 0;

  @override
  void initState() {
    controller = PageController(
      initialPage: currentIndex,
      keepPage: true,
      viewportFraction: 0.8,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Popular Jobs",
                style: kBoldStyle.copyWith(fontSize: 17),
              ),
              const Spacer(),
              Text(
                "See all",
                style: kMedStyle.copyWith(fontSize: 15),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 160,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: controller,
            onPageChanged: (selectedIndex) {
              setState(() {
                currentIndex = selectedIndex;
              });
            },
            itemBuilder: ((context, index) =>
                JobItem(jobList[index], currentIndex == index)),
            itemCount: jobList.length,
          ),
        ),
      ],
    );
  }
}
