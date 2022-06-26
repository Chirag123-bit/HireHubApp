import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/category/category_with_count.dart';
import 'package:hirehub/repository/category_repository.dart';
import 'package:hirehub/response/categoryResponse/get_category_with_count_response.dart';
import 'package:hirehub/utils/url.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

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
            decoration: const BoxDecoration(color: Colors.white),
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
                              color: Colors.black, fontSize: 20),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Ready for the next step?",
                      style: kTitleStyle.copyWith(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Choose your prefered category",
                      style: kSubtitleStyle.copyWith(
                        color: Colors.black,
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
                          color: kSilverColor,
                          borderRadius: BorderRadius.circular(34),
                        ),
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 8 / 9),
                            itemCount: lstCats.length,
                            itemBuilder: (BuildContext context, int index) {
                              return (LongCourseCard(
                                  background: Colors.red,
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
  final Color background;
  final String title;
  final String subtitle;
  final String image;
  const LongCourseCard(
      {Key? key,
      required this.background,
      required this.title,
      required this.subtitle,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imgUrl = (baseImgUrl + image.replaceAll("\\", "/"));
    return Container(
      width: 155,
      height: 192,
      decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white, width: 5),
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
