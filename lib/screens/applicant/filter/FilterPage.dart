import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/Company.dart';
import 'package:hirehub/screens/applicant/filter/FilterCompanyCard.dart';
import 'package:hirehub/screens/applicant/filter/FilterJob.dart';
import 'package:hirehub/screens/applicant/home/widgets/SearchControl.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  int _cardIndex = 0;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: ScreenUtil().setHeight(300),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/images/search.svg',
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      const Spacer(),
                      Text(
                        "Browse through our vast trove of jobs and companies",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(20),
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(),
                      Text(
                        "Get started by filtering your search",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(12),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                SizedBox(height: kSpacingUnit * 3),
                const SearchControl(),
                SizedBox(
                  width: double.infinity,
                  height: ScreenUtil().setHeight(270),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Text("Top Companies",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(21),
                            fontWeight: FontWeight.bold,
                          )),
                      const Spacer(),
                      CarouselSlider.builder(
                        options: CarouselOptions(
                          autoPlay: true,
                          height: 140.w,
                          // aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: _cardIndex,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _cardIndex = index;
                            });
                          },
                        ),
                        itemCount: Company.generatedCompanies().length,
                        itemBuilder: (BuildContext context, int index, int _) =>
                            Expanded(
                          child: Container(
                            width: double.infinity,
                            margin:
                                EdgeInsets.symmetric(horizontal: kSpacingUnit),
                            child: CompanyCard(
                                company: Company.generatedCompanies()[index]),
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                SizedBox(height: kSpacingUnit * 2),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: kSpacingUnit * 2),
                      Text("Popular Jobs",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(21),
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(height: kSpacingUnit * 2),
                      const FilterJob(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
