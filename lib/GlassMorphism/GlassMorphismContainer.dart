// ignore: file_names
import 'dart:ui';

import 'package:flutter/material.dart';

class GlassMorphismContainer extends StatelessWidget {
  final double height;
  final double width;
  final double borderRadius;
  final Widget child;
  const GlassMorphismContainer({
    Key? key,
    required this.height,
    required this.width,
    this.borderRadius = 20.0,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              gradient: RadialGradient(colors: [
                Colors.white.withOpacity(0.20),
                Colors.white.withOpacity(0.10),
              ], radius: 50.0),
            ),
            child: child,
          ),
        ),
      );
    });
  }
}
