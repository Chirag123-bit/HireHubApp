import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/screens/applicant/filter/FilterPage.dart';
import 'package:hirehub/screens/applicant/home/HomeScreen.dart';
import 'package:hirehub/screens/applicant/settings/SettingScreen.dart';
import 'package:hirehub/screens/message/ChatHomeScreen.dart';
import 'package:hirehub/theme/Theme.dart';

class ApplicantMainPage extends StatefulWidget {
  const ApplicantMainPage({Key? key}) : super(key: key);

  @override
  State<ApplicantMainPage> createState() => _ApplicantMainPageState();
}

class _ApplicantMainPageState extends State<ApplicantMainPage> {
  int _selectedIndex = 0;

  List<Widget> applicantScreens = [
    HomeScreen(),
    const FilterPage(),
    const ChatHomeScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: applicantScreens[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: GNav(
          tabBackgroundColor: Colors.grey.shade500,
          gap: 8,
          padding: const EdgeInsets.all(16),
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          tabs: [
            GButton(
              icon: Icons.home,
              text: "Home",
              backgroundColor: primaryClr.withOpacity(0.7),
              textStyle: TextStyle(fontSize: navTextSize),
              iconSize: navTextSize * 1.3,
            ),
            GButton(
              icon: Icons.search,
              text: "Explore",
              backgroundColor: yellowClr.withOpacity(0.7),
              textStyle: TextStyle(fontSize: navTextSize),
              iconSize: navTextSize * 1.3,
            ),
            GButton(
              key: const Key('chat'),
              icon: Icons.message,
              text: "Messages",
              backgroundColor: pinkClr.withOpacity(0.7),
              textStyle: TextStyle(fontSize: navTextSize),
              iconSize: navTextSize * 1.3,
            ),
            GButton(
              key: const Key('settings'),
              icon: Icons.settings,
              text: "Settings",
              backgroundColor: Colors.green.withOpacity(0.7),
              textStyle: TextStyle(fontSize: navTextSize),
              iconSize: navTextSize * 1.3,
            ),
          ],
        ),
      ),
    );
  }
}
