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
            Container(
              margin: const EdgeInsets.only(
                  left: 15, right: 15, top: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Latest Jobs",
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
            LatestJobs()
          ],
        )
      ],
    );
  }
}
