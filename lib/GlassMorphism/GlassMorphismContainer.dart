import 'package:flutter/material.dart';

class GlassMorphismContainer extends StatelessWidget {
  final double height;
  final double width;
  final double borderRadius;
  final Widget child;
  GlassMorphismContainer({
    Key? key,
    required this.size,
    required this.height,
    required this.width,
    this.borderRadius = 20.0,
    required this.child,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
        gradient: RadialGradient(colors: [
          Colors.white.withOpacity(0.20),
          Colors.white.withOpacity(0.10),
        ], radius: 50.0),
      ),
      child: child,
    );
  }
}
