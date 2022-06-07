import 'package:flutter/material.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/Job.dart';
import 'package:readmore/readmore.dart';

class JobDetails extends StatelessWidget {
  final Job job;

  const JobDetails({Key? key, required this.job}) : super(key: key);

  static const description =
      "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.. comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.";

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
          style: kTitleStyle.copyWith(
              fontFamily: "Poppins", fontWeight: FontWeight.w600, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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
                    style: kTitleStyle.copyWith(
                        fontFamily: "Poppins", fontSize: 26),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    job.company,
                    style: kTitleStyle.copyWith(
                        fontFamily: "Poppins", fontSize: 14),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    job.time,
                    style: kSubtitleStyle.copyWith(
                        fontFamily: "Poppins", fontSize: 12, color: kBlack),
                  )
                ],
              ),
            ),
            const SizedBox(height: 18),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Apply Beofre",
                            style: kTitleStyle.copyWith(
                                fontFamily: "Poppins", fontSize: 11.5),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "30 July, 2022",
                            style: kSubtitleStyle.copyWith(
                                fontFamily: "Poppins",
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Job Nature",
                            style: kTitleStyle.copyWith(
                                fontFamily: "Poppins", fontSize: 11.5),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.horizontal(),
                                color: kSilver),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              child: Text(
                                "Full TIme",
                                style: kSubtitleStyle.copyWith(
                                    fontFamily: "Poppins",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Apply Beofre",
                            style: kTitleStyle.copyWith(
                                fontFamily: "Poppins", fontSize: 11.5),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "30 July, 2022",
                            style: kSubtitleStyle.copyWith(
                                fontFamily: "Poppins",
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Job Nature",
                            style: kTitleStyle.copyWith(
                                fontFamily: "Poppins", fontSize: 11.5),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.horizontal(),
                                color: kSilver),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              child: Text(
                                "Full TIme",
                                style: kSubtitleStyle.copyWith(
                                    fontFamily: "Poppins",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 18),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Job Description",
                    style: kTitleStyle.copyWith(
                        fontFamily: "Poppins", fontSize: 11.5),
                  ),
                  const SizedBox(height: 10),
                  ReadMoreText(
                    description,
                    trimLines: 10,
                    textAlign: TextAlign.justify,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: "See More ",
                    trimExpandedText: "See Less ",
                    style: kSubtitleStyle.copyWith(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Job Description",
                    style: kTitleStyle.copyWith(
                        fontFamily: "Poppins", fontSize: 11.5),
                  ),
                  const SizedBox(height: 10),
                  ReadMoreText(
                    description,
                    trimLines: 10,
                    textAlign: TextAlign.justify,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: "See More ",
                    trimExpandedText: "See Less ",
                    style: kSubtitleStyle.copyWith(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
