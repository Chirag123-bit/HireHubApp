import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/category/Category.dart';
import 'package:hirehub/theme/Theme.dart';

class CategoryCard extends StatelessWidget {
  final Category data;
  final double _borderRadius = 24;
  CategoryCard({Key? key, required this.data}) : super(key: key);

  List<LinearGradient> gradients = [
    const LinearGradient(
      colors: [Color(0xffaddbaf), Color(0xff2095f3)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    ),
    const LinearGradient(
      colors: [Color(0xffb1fff8), Color(0xff2095f3)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    ),
    const LinearGradient(
      colors: [Color(0xffa8b0e1), Color(0xff2095f3)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    ),
    const LinearGradient(
      colors: [Color(0xffdf9fea), Color(0xff2095f3)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    ),
    const LinearGradient(
      colors: [Color(0xfff9978f), Color(0xff2095f3)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    )
  ];
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Stack(
      children: [
        Container(
          height: 120.sp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kSpacingUnit * 3),
            gradient: gradients[_random.nextInt(gradients.length)],
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          top: 0,
          child: CustomPaint(
            size: Size(100.sp, 115.sp),
            painter:
                CustomCardShapePainter(_borderRadius, primaryClr, Colors.grey),
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: kSpacingUnit * 1.8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  data.image!,
                  height: 90.sp,
                  width: 90.sp,
                ),
                Text(data.title!,
                    style: kCaptionTextStyle.copyWith(
                      fontSize: 22,
                      color: Colors.white,
                    )),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class CustomCardShapePainter extends CustomPainter {
  final double radius;
  final Color startColor;
  final Color endColor;

  CustomCardShapePainter(this.radius, this.startColor, this.endColor);

  @override
  void paint(Canvas canvas, Size size) {
    var radius = 24.0;

    var paint = Paint();
    paint.shader = ui.Gradient.linear(
        const Offset(0, 0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
      endColor
    ]);

    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
