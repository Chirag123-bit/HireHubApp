import 'package:flutter/material.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/Job.dart';

class DescriptionTab extends StatelessWidget {
  const DescriptionTab({Key? key, required this.job}) : super(key: key);
  final Job job;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: [
        const SizedBox(height: 20),
        Text(
          "About the opportunity",
          style: kTitleStyle.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 15),
        Text(
          job.description!,
          style: kSubtitleStyle.copyWith(
              fontWeight: FontWeight.w300,
              height: 1.5,
              color: const Color(0xff5b5b5b)),
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 20),
        Text(
          "Job Responsibilities",
          style: kTitleStyle.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 15),
        Column(
          children: job.requirements!
              .map(
                (e) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "•   ",
                      style: kPageTitleStyle,
                    ),
                    Expanded(
                      child: Text(
                        "$e\n",
                        style: kSubtitleStyle.copyWith(
                          fontWeight: FontWeight.w300,
                          height: 1.5,
                          color: const Color(0xff5b5b5b),
                        ),
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        )
      ],
    ));
  }
}
