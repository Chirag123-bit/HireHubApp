import 'package:flutter/material.dart';
import 'package:hirehub/wearOs/EmployerDashboard.dart';
import 'package:hirehub/wearOs/dashboard.dart';
import 'package:hirehub/wearOs/login.dart';
import 'package:wear/wear.dart';

class WearOsApp extends StatelessWidget {
  const WearOsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WatchShape(
        builder: (BuildContext context, WearShape shape, Widget? child) {
      return AmbientMode(builder: ((context, mode, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'HireHub',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: Brightness.dark,
              backgroundColor: const Color(0xff2d2f41),
              // visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: const WearOsHome(),
            routes: {
              "/wearDashboard": (context) => const DashboardScreen(),
              "/wearDashboardEmployer": (context) =>
                  const EmployerDashboardScreen(),
            });
      }));
    });
  }
}
