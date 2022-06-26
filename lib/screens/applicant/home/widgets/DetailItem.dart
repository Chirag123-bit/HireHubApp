import 'package:flutter/material.dart';
import 'package:hirehub/config/Constants.dart';

class DetailItem extends StatelessWidget {
  final String data;

  const DetailItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kSpacingUnit * 2),
      child: Text(
        data,
        textAlign: TextAlign.justify,
        style: kCaptionTextStyle.copyWith(
          color: kPrimaryTextColor,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
