import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirehub/config/Constants.dart';

class DetailItem extends StatelessWidget {
  final String data;

  const DetailItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kSpacingUnit * 1.5),
      child: Text(
        "⦿ " + data,
        textAlign: TextAlign.justify,
        style: kCaptionTextStyle.copyWith(
          fontWeight: FontWeight.w400,
          // fontSize: 13,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
