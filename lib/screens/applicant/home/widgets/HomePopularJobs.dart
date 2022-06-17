import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/Job.dart';

class HomePopularJobs extends StatefulWidget {
  const HomePopularJobs({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePopularJobs> createState() => _HomePopularJobsState();
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
          aspectRatio: 16 / 9,
          enlargeCenterPage: true,
          viewportFraction: 0.8,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          height: 115.w,
          initialPage: _cardIndex,
          onPageChanged: (index, reason) {
            setState(() {
              _cardIndex = index;
            });
          },
        ),
        itemCount: Job.generatedJobs().length,
        itemBuilder: (context, index, int _) => Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          child: JobCard(
            data: Job.generatedJobs()[index],
          ),
        ),
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  final Job data;
  const JobCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                "assets/images/google.svg",
                height: 30.sp,
                width: 30.sp,
              ),
              SizedBox(width: 10.w),
              Text(
                data.company!,
                style: kSubtitleStyle.copyWith(
                    fontSize: 20.sp, color: Colors.grey),
              ),
              const Spacer(),
              const Icon(Icons.bookmark_outline)
            ],
          ),
          const Spacer(),
          Text(
            data.title!,
            style: kSubtitleStyle.copyWith(
                fontSize: 17.sp, fontWeight: FontWeight.w500),
          ),
          Text(data.location!,
              style: kSubtitleStyle.copyWith(color: Colors.grey)),
        ],
      ),
    );
  }
}
