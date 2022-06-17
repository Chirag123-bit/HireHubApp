import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirehub/screens/applicant/home/widgets/HomeAppBar.dart';
import 'package:hirehub/screens/applicant/home/widgets/JobWidget.dart';
import 'package:hirehub/screens/applicant/home/widgets/SearchCard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
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
            // TagList(),
            // JobList(),
            // Container(
            //   margin: const EdgeInsets.only(
            //       left: 15, right: 15, top: 20, bottom: 10),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       Text(
            //         "Latest Jobs",
            //         style: kBoldStyle.copyWith(fontSize: 17),
            //       ),
            //       const Spacer(),
            //       Text(
            //         "See all",
            //         style: kMedStyle.copyWith(fontSize: 15),
            //       ),
            //     ],
            //   ),
            // ),
            // LatestJobs()
            const SizedBox(
              height: 20,
            ),
            const JobWidget(),
          ],
        )
      ],
    );
  }
}
