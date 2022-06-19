import 'package:flutter/material.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/Category.dart';
import 'package:hirehub/screens/applicant/home/widgets/CategoryCard.dart';

class HomePopularCategories extends StatelessWidget {
  const HomePopularCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: Category.generatedCategories()
            .sublist(0, 3)
            .asMap()
            .entries
            .map(
              (item) => Container(
                margin:
                    EdgeInsets.symmetric(horizontal: kSpacingUnit * 3).copyWith(
                  top: item.key == 0 ? kSpacingUnit * 2 : 0,
                  bottom: kSpacingUnit * 2,
                ),
                child: CategoryCard(data: item.value),
              ),
            )
            .toList(),
      ),
    );
  }
}
