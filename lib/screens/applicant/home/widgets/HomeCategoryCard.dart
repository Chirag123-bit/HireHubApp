import 'package:flutter/material.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/category/Category.dart';
import 'package:hirehub/models/category/category_with_count.dart';
import 'package:hirehub/repository/category_repository.dart';
import 'package:hirehub/response/categoryResponse/get_category_with_count_response.dart';
import 'package:hirehub/screens/applicant/home/widgets/CategoryCard.dart';

class HomePopularCategories extends StatelessWidget {
  const HomePopularCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: FutureBuilder<CategoryWithCountResponse?>(
            future: CategoryRepository().getAllCategory(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  List<CategoryWithCount> lstCats = snapshot.data!.data!;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: Category.generatedCategories()
                        .sublist(0, 3)
                        .asMap()
                        .entries
                        .map(
                          (item) => Container(
                            margin: EdgeInsets.symmetric(
                                    horizontal: kSpacingUnit * 3)
                                .copyWith(
                              top: item.key == 0 ? kSpacingUnit * 2 : 0,
                              bottom: kSpacingUnit * 2,
                            ),
                            child: CategoryCard(data: item.value),
                          ),
                        )
                        .toList(),
                  );
                } else {
                  return const Text("No Jobs Found");
                }
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const Text("Error retriving data");
              }
            }));
  }
}
