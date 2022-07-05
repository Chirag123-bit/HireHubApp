import 'package:flutter/material.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/Job.dart';
import 'package:hirehub/screens/applicant/home/widgets/job_details/DetailContent.dart';
import 'package:hirehub/screens/applicant/home/widgets/job_details/DetailFooter.dart';
import 'package:hirehub/screens/applicant/home/widgets/job_details/DetailHeader.dart';

class DetailScreen extends StatelessWidget {
  final Job data;

  const DetailScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSilverColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                DetailHeader(data: data),
                DetailContent(data: data),
              ],
            ),
            DetailFooter(
              data: data,
            ),
          ],
        ),
      ),
    );
  }
}
