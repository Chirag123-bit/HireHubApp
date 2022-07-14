import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirehub/models/category/Category.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  double _selectedRange = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filter"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sallary",
              style: Theme.of(context).textTheme.headline5!,
            ),
            Slider(
                label: "$_selectedRange" "K",
                value: _selectedRange,
                max: 100,
                min: 0,
                divisions: 5,
                onChanged: (value) {
                  setState(() {
                    _selectedRange = value;
                  });
                }),
            Text(
              "Category",
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Get.isDarkMode ? Colors.white : Colors.grey[600],
                  ),
            ),
            CustomCategoryFilter(categories: Category.generatedCategories())
          ],
        ),
      ),
    );
  }
}

class CustomCategoryFilter extends StatelessWidget {
  final List<Category> categories;
  const CustomCategoryFilter({Key? key, required this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              // color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(categories[index].title!,
                    style: const TextStyle(fontSize: 20)),
                SizedBox(
                  height: 25,
                  child: Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                )
              ],
            ));
      },
    );
  }
}
