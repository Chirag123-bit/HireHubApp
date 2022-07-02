import 'package:flutter/material.dart';
import 'package:hirehub/config/SizeConfig.dart';
import 'package:hirehub/screens/splash/container/body.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? token;

  @override
  void initState() {
    super.initState();
    _getToken().whenComplete(() => {
          if (token != null) {Navigator.pushReplacementNamed(context, '/home')}
        });
  }

  Future _getToken() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var storedToken = sharedPreferences.getString('token');

    setState(() {
      token = storedToken;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: Body(),
    );
  }
}
