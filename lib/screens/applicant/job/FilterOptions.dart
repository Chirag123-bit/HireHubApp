import 'package:flutter/material.dart';
import 'package:hirehub/config/Constants.dart';

class FilterScreenOptions extends StatelessWidget {
  const FilterScreenOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Options'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Sallary",
              style: kHeadingTextStyle.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: kSpacingUnit * 2),
            const CustomPriceFilter(),
            SizedBox(height: kSpacingUnit * 2),
            Text(
              "Category",
              style: kHeadingTextStyle.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: kSpacingUnit * 2),
            const CustomCategoryFilter(),
          ]),
        ),
      ),
    );
  }
}

class CustomPriceFilter extends StatelessWidget {
  const CustomPriceFilter({Key? key}) : super(key: key);
  static const sallaries = [
    "10K",
    "20K",
    "30K",
    "40K",
    "50K",
    "60K",
    "70K",
    "80K",
    "90K",
    "100K"
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: sallaries
            .map(
              (sallary) => Container(
                margin: const EdgeInsets.only(right: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Text(
                  sallary,
                  style: kTitleStyle,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class CustomCategoryFilter extends StatelessWidget {
  const CustomCategoryFilter({Key? key}) : super(key: key);

  static final List<String> categories = [
    "Information Technology",
    "Finance",
    "Health Care",
    "Education",
    "Marketing",
    "Skilled Labor",
    "Human Resources",
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Row(
            children: [
              Text(
                categories[index],
                style: kTitleTextStyle,
              ),
              const Spacer(),
              SizedBox(
                height: 25,
                child: Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
