import 'package:flutter/material.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/theme/Theme.dart';

class SearchTag extends StatelessWidget {
  final String tag;

  const SearchTag({
    Key? key,
    required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kSpacingUnit * 2, //3
      width: kSpacingUnit * 8, //9
      margin: EdgeInsets.only(left: kSpacingUnit),
      decoration: BoxDecoration(
        color: primaryClr,
        borderRadius: BorderRadius.circular(kSpacingUnit * 3),
      ),
      child: Center(
        child: Text(
          tag,
          textAlign: TextAlign.center,
          style: kCaptionTextStyle.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
