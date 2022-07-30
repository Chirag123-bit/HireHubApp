import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/category/category_with_count.dart';
import 'package:hirehub/repository/category_repository.dart';
import 'package:hirehub/response/categoryResponse/get_category_with_count_response.dart';
import 'package:hirehub/utils/url.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);
  static List<Color> sky = [const Color(0xFF6448FE), const Color(0xFF5FC6FF)];
  static List<Color> sunset = [
    const Color(0xFFFE6197),
    const Color(0xFFFFB463)
  ];
  static List<Color> sea = [const Color(0xFF61A3FE), const Color(0xFF63FFD5)];
  static List<Color> mango = [const Color(0xFFFFA738), const Color(0xFFFFE130)];
  static List<Color> fire = [const Color(0xFFFF5DCD), const Color(0xFFFF8484)];

  static List<List<Color>> grads = [sky, sunset, sea, mango, fire];
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            padding: const EdgeInsets.only(left: 24),
            height: size.height / 4,
            width: size.width,
            decoration: const BoxDecoration(
                // color: Get.isDarkMode ? Colors.white : Colors.grey[600],
                ),
            child: SafeArea(
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Category",
                          style: kSubtitleStyle.copyWith(
                              color: Get.isDarkMode
                                  ? Colors.white
                                  : Colors.grey[600],
                              fontSize: 20),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Ready for the next step?",
                      style: kTitleStyle.copyWith(
                          color:
                              Get.isDarkMode ? Colors.white : Colors.grey[600],
                          fontSize: 28,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Choose your prefered category",
                      style: kSubtitleStyle.copyWith(
                        color: Get.isDarkMode ? Colors.white : Colors.grey[600],
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: FutureBuilder<CategoryWithCountResponse?>(
                future: CategoryRepository().getAllCategory(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      List<CategoryWithCount> lstCats = snapshot.data!.data!;
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        height: size.height - (size.height / 5),
                        width: size.width,
                        // margin: const EdgeInsets.only(top: 0),
                        decoration: BoxDecoration(
                          color: Get.isDarkMode ? Colors.grey[900] : kSilver,
                          borderRadius: BorderRadius.circular(34),
                        ),
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 8 / 9),
                            itemCount: lstCats.length,
                            itemBuilder: (BuildContext context, int index) {
                              return (LongCourseCard(
                                  clr: grads[_random.nextInt(grads.length)],
                                  title: lstCats[index].category!.title!,
                                  subtitle: lstCats[index].jobs.toString(),
                                  image: lstCats[index].category!.image!));
                            }),
                      );
                    } else {
                      return const Text("No Jobs Found");
                    }
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return const Text("Error retriving data");
                  }
                })),
      ],
    ));
  }
}

class LongCourseCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final List<Color> clr;
  const LongCourseCard(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.image,
      required this.clr})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imgUrl = (baseImgUrl + image.replaceAll("\\", "/"));
    return Container(
      width: 155,
      height: 192,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: clr,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
              color: Get.isDarkMode ? Colors.grey[900]! : kSilver, width: 5),
          boxShadow: [
            BoxShadow(
                blurRadius: 50,
                color: const Color(0xff0b0c2a).withOpacity(0.09),
                offset: const Offset(10, 10))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 16,
          ),
          Text(
            title,
            style: kTitleStyle.copyWith(color: Colors.white),
          ),
          Text(
            subtitle + " Jobs Available",
            style: kSubtitleStyle.copyWith(color: Colors.white),
          ),
          Expanded(
            child: Image.network(imgUrl),
          ),
        ],
      ),
    );
  }
}
