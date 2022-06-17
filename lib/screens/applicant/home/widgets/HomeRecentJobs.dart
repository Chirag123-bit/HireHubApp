import 'package:flutter/cupertino.dart';
import 'package:hirehub/models/Job.dart';
import 'package:hirehub/screens/applicant/home/widgets/HomePopularJobs.dart';

class HomeRecentJobs extends StatelessWidget {
  const HomeRecentJobs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: Job.generatedJobs()
            .asMap()
            .entries
            .map((item) => JobCard(data: item.value))
            .toList(),
      ),
    );
  }
}
