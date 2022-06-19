import 'package:flutter/material.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/config/test_data.dart';
import 'package:hirehub/screens/applicant/home/widgets/JobCard.dart';

class FilterJob extends StatelessWidget {
  const FilterJob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: recentJobs.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Column(
          children: [
            JobCard(data: recentJobs[index]),
            SizedBox(height: kSpacingUnit * 2),
          ],
        );
      },
    );
  }
}
