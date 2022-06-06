import 'package:flutter/material.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/Job.dart';

class JobDetails extends StatelessWidget {
  final Job job;

  const JobDetails({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSilver,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSilver,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kBlack,
          ),
          onPressed: () {},
        ),
        title: Text(
          job.company,
          style:
              kTitleStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  job.logoUrl,
                  width: 50,
                ),
                const SizedBox(height: 10),
                Text(
                  job.title,
                  style: kPageTitleStyle,
                ),
                const SizedBox(height: 10),
                Text(
                  job.company,
                  style: kTitleStyle,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  job.time,
                  style: kSubtitleStyle,
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
            decoration: const BoxDecoration(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
