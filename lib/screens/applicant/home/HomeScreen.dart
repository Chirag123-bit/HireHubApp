import 'package:flutter/material.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/screens/applicant/home/widgets/HomeAppBar.dart';
import 'package:hirehub/screens/applicant/home/widgets/JobList.dart';
import 'package:hirehub/screens/applicant/home/widgets/LatestJobs.dart';
import 'package:hirehub/screens/applicant/home/widgets/SearchCard.dart';
import 'package:hirehub/screens/applicant/home/widgets/TagList.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(),
            ),
            Expanded(
              flex: 1,
              child: Container(color: kBackgroundColor),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeAppBar(),
            const SearchCard(),
            const SizedBox(
              height: 10,
            ),
            TagList(),
            JobList(),
            LatestJobs()
          ],
        )
      ],
    );
  }
}
