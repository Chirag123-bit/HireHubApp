// import 'package:flutter/material.dart';
// // ignore: import_of_legacy_library_into_null_safe
// import 'package:simple_animations/simple_animations.dart';

// class FadeAnimation extends StatelessWidget {
//   final double delay;
//   final Widget child;

//   const FadeAnimation(this.delay, this.child);

//   @override
//   Widget build(BuildContext context) {
//     final tween = MultiTrackTween([
//       Track("opacity")
//           .add(const Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
//       Track("translateY").add(
//           const Duration(milliseconds: 500), Tween(begin: -30.0, end: 0.0),
//           curve: Curves.easeOut)
//     ]);

//     return ControlledAnimation(
//       delay: Duration(milliseconds: (500 * delay).round()),
//       duration: tween.duration,
//       tween: tween,
//       child: child,
//       builderWithChild: (context, child, animation) => Opacity(
//         opacity: animation!["opacity"],
//         child: Transform.translate(
//             offset: Offset(0, animation!["translateY"]), child: child),
//       ),
//     );
//   }
// }
