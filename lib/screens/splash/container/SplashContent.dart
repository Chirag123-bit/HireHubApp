import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hirehub/config/Palette.dart';
import 'package:hirehub/config/SizeConfig.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          image,
          height: getProportionateScreenHeight(500),
          width: getProportionateScreenWidth(450),
          // color: Colors.transparent,
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Palette.primaryColor,
              fontSize: getProportionateScreenWidth(25),
            ),
          ),
        ),
      ],
    );
  }
}
