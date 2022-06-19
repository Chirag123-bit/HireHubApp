// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/Job.dart';
import 'package:hirehub/screens/applicant/job/CompanyTab.dart';
import 'package:hirehub/screens/applicant/job/DescriptionTab.dart';

class JobDetail extends StatelessWidget {
  final Job job;
  const JobDetail({Key? key, required this.job}) : super(key: key);

  static const tags = ["Full Time", "Part Time", "Freelance"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kSilver,
        appBar: AppBar(
          title: Text(job.company!, style: kTitleStyle),
          backgroundColor: kSilver,
          elevation: 0,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: kBlack,
              )),
          centerTitle: true,
        ),
        body: DefaultTabController(
          length: 2,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                Container(
                  constraints: const BoxConstraints(maxHeight: 250),
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: const DecorationImage(
                                image:
                                    AssetImage("assets/images/google_logo.png"),
                              )),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        job.title!,
                        style:
                            kTitleStyle.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Rs. 50,000 - 100,000",
                        style: kSubtitleStyle,
                      ),
                      const SizedBox(height: 15),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: tags
                              .map(
                                (e) => Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: kBlack.withOpacity(0.5)),
                                  ),
                                  child: Text(e, style: kSubtitleStyle),
                                ),
                              )
                              .toList()),
                      const SizedBox(height: 16),
                      Material(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                              color: kBlack.withOpacity(0.2),
                            ),
                          ),
                          child: TabBar(
                              unselectedLabelColor: kBlack,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: kOrange,
                              ),
                              tabs: const [
                                Tab(text: "Description"),
                                Tab(text: "Company"),
                              ])),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(children: [
                    DescriptionTab(job: job),
                    CompanyTab(job: job),
                  ]),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            padding: const EdgeInsets.only(left: 18, bottom: 25, right: 18),
            color: Colors.white,
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: kBlack.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.bookmark_border, color: kBlack),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text("Apply for this job",
                          style: kTitleStyle.copyWith(
                            color: Colors.white,
                          )),
                      color: kBlack,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
