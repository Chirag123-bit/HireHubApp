import 'package:flutter/material.dart';
import 'package:hirehub/config/SizeConfig.dart';
import 'package:hirehub/screens/splash/container/body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: Body(),
    );
  }
}
