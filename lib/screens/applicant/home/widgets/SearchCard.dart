import 'package:flutter/material.dart';
import 'package:hirehub/config/Constants.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Theme.of(context).primaryColor,
          ),
          hintText: 'Search for jobs, companies...',
          hintStyle: kMedStyle.copyWith(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
