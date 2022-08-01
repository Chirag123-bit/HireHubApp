import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/Job.dart';
import 'package:hirehub/repository/job_repository.dart';
import 'package:hirehub/response/jobResponse/get_jobs_response.dart';
import 'package:hirehub/screens/applicant/home/widgets/JobCard.dart';

class HomePopularJobs extends StatefulWidget {
  const HomePopularJobs({Key? key}) : super(key: key);

  @override
  _HomePopularJobsState createState() => _HomePopularJobsState();
}

class _HomePopularJobsState extends State<HomePopularJobs> {
  int _cardIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 175.w,
        child: FutureBuilder<JobsResponse?>(
            future: JobsRepository().getAllJobs(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done ||
                  snapshot.hasData) {
                if (snapshot.hasData) {
                  List<Job> lstJobs = snapshot.data!.data!;
                  return CarouselSlider.builder(
                    options: CarouselOptions(
                      autoPlay: true,
                      height: 110.w,
                      aspectRatio: 10 / 5,
                      viewportFraction: 0.9,
                      initialPage: _cardIndex,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _cardIndex = index;
                        });
                      },
                    ),
                    itemCount: lstJobs.length,
                    itemBuilder: (BuildContext context, int index, int _) =>
                        Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: kSpacingUnit),
                      child: JobCard(
                        data: lstJobs[index],
                        uniqueIdentifier: "popular",
                      ),
                    ),
                  );
                }
                return const Text("No Jobs Found");
              } else if (snapshot.connectionState == ConnectionState.waiting &&
                  snapshot.hasData == false) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const Text("Error retriving data");
              }
            }));
  }
}
