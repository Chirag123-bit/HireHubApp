import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/config/test_data.dart';
import 'package:hirehub/screens/applicant/home/widgets/JobCard.dart';

class HomePopularJobs extends StatefulWidget {
  @override
  _HomePopularJobsState createState() => _HomePopularJobsState();
}

class _HomePopularJobsState extends State<HomePopularJobs> {
  int _cardIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175.w,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          autoPlay: true,
          height: 130.w,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: _cardIndex,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            setState(() {
              _cardIndex = index;
            });
          },
        ),
        itemCount: popularJobs.length,
        itemBuilder: (BuildContext context, int index, int _) => Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: kSpacingUnit),
          child: JobCard(data: popularJobs[index]),
        ),
      ),
    );
  }
}
