import 'package:flutter/material.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/Job.dart';
import 'package:hirehub/repository/job_repository.dart';
import 'package:hirehub/response/jobResponse/get_jobs_response.dart';
import 'package:hirehub/screens/applicant/home/widgets/JobCard.dart';

class HomeRecentJobs extends StatelessWidget {
  const HomeRecentJobs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: FutureBuilder<JobsResponse?>(
            future: JobsRepository().getAllJobs(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  List<Job> lstJobs = snapshot.data!.data!;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: lstJobs
                        .asMap()
                        .entries
                        .map(
                          (item) => Container(
                            margin: EdgeInsets.symmetric(
                                    horizontal: kSpacingUnit * 3)
                                .copyWith(
                              top: item.key == 0 ? kSpacingUnit * 2 : 0,
                              bottom: kSpacingUnit * 2,
                            ),
                            child: JobCard(
                              data: item.value,
                              uniqueIdentifier: "recent",
                            ),
                          ),
                        )
                        .toList(),
                  );
                } else {
                  return const Text("No Jobs Found");
                }
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const Text("Error retriving data");
              }
            }));
  }
}
