import 'package:flutter/material.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/Job.dart';

class CompanyTab extends StatelessWidget {
  const CompanyTab({Key? key, required this.job}) : super(key: key);
  final Job job;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          const SizedBox(height: 20),
          Text("About Company",
              style: kTitleStyle.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 15),
          Text(
            job.company_desc!,
            style: kSubtitleStyle.copyWith(
              fontWeight: FontWeight.w300,
              height: 1.5,
              color: const Color(0xff5b5b5b),
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
