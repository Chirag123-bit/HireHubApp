import 'dart:async';

import 'package:all_sensors2/all_sensors2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/screens/applicant/events/EventsScreen.dart';
import 'package:hirehub/screens/applicant/job/AppliedJobsScreen.dart';
import 'package:hirehub/screens/applicant/job/SavedJobScreen.dart';
import 'package:hirehub/screens/applicant/settings/basic_info_screen.dart';
import 'package:hirehub/screens/applicant/settings/change_password_screen.dart';
import 'package:hirehub/screens/applicant/settings/education_info_screen.dart';
import 'package:hirehub/screens/applicant/settings/professional_info_screen.dart';
import 'package:hirehub/screens/applicant/settings/work_info_screen.dart';
import 'package:hirehub/screens/applicant/todos/TodoScreen.dart';
import 'package:hirehub/screens/auth/Login.dart';
import 'package:hirehub/services/notification_services.dart';
import 'package:hirehub/services/theme_services.dart';
import 'package:hirehub/theme/Theme.dart';
import 'package:shake_event/shake_event.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> with ShakeHandler {
  var notifyHelper;
  bool isDarkMode = Get.isDarkMode;
  late String token;
  final double _proximityValue = 0;
  final List<StreamSubscription<dynamic>> _streamSubscriptions =
      <StreamSubscription<dynamic>>[];

  @override
  void initState() {
    startListeningShake(20);
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
    _getToken();
    _streamSubscriptions.add(proximityEvents!.listen((ProximityEvent event) {
      if (event.proximity < 3) {
        ThemeServices().switchTheme();
        notifyHelper.displayNotification(
          title: "Theme Changed",
          body: Get.isDarkMode ? "Activated Light mode" : "Activeted Dark Mode",
        );
      }
    }));
  }

  @override
  shakeEventListener() {
    Get.back();
    return super.shakeEventListener();
  }

  @override
  void dispose() {
    for (var subscription in _streamSubscriptions) {
      subscription.cancel();
    }
    resetShakeListeners();
    super.dispose();
  }

  Future _getToken() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var storedToken = sharedPreferences.getString('token');

    setState(() {
      token = storedToken!;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 25),
        child: ListView(
          children: [
            Text(
              "Settings",
              style: titleStyle.copyWith(
                fontSize: 22.sp,
                fontFamily: GoogleFonts.lato().fontFamily,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dark Mode",
                  key: const Key("darkModeSlider"),
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.lato().fontFamily),
                ),
                Transform.scale(
                  scale: 0.7,
                  child: CupertinoSwitch(
                      key: const Key("darkModeSwitch"),
                      value: isDarkMode,
                      onChanged: (value) {
                        setState(() {
                          isDarkMode = !isDarkMode;
                        });
                        ThemeServices().switchTheme();
                        notifyHelper.displayNotification(
                          title: "Theme Changed",
                          body: Get.isDarkMode
                              ? "Activated Light mode"
                              : "Activeted Dark Mode",
                        );
                        // notifyHelper.scheduledNotification();
                      }),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: primaryClr,
                  size: 18.sp,
                ),
                const SizedBox(width: 8),
                Text(
                  "Account",
                  style: kTitleStyle.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.lato().fontFamily),
                ),
              ],
            ),
            const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            BuildSettingOption(
              title: "Basic Info",
              onPressed: () {
                Get.to(() => const EditBasicInfoScreen());
              },
            ),
            BuildSettingOption(
                title: "Professional Info",
                onPressed: () {
                  Get.to(() => const EditProfessionalInfoScreen());
                }),
            BuildSettingOption(
                title: "Educational Records",
                onPressed: () {
                  Get.to(() => const EditEducationalInfoScreen());
                }),
            BuildSettingOption(
                title: "Experience Records",
                onPressed: () {
                  Get.to(() => EditWorkInfoScreen());
                }),
            BuildSettingOption(
                title: "Change Password",
                onPressed: () {
                  Get.to(() => ChangePasswordScreen());
                }),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.person_pin,
                  color: primaryClr,
                  size: 18.sp,
                ),
                const SizedBox(width: 8),
                Text(
                  "Personal Space",
                  style: kTitleStyle.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.lato().fontFamily),
                ),
              ],
            ),
            const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            BuildSettingOption(
                title: "My Events",
                onPressed: () async {
                  await Get.to(() => const EventsScreen());
                }),
            BuildSettingOption(
                title: "My ToDos",
                onPressed: () {
                  Get.to(() => const TodoScreen());
                }),
            BuildSettingOption(
                title: "Applied Jobs",
                onPressed: () {
                  Get.to(() => const AppliedJobScreen());
                }),
            BuildSettingOption(
                title: "Saved Jobs",
                onPressed: () {
                  Get.to(() => const SavedJobScreen());
                }),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)))),
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.clear();
                Get.offAll(const LoginScreen());
              },
              child: Text(
                "Sign Out",
                style: TextStyle(
                  fontSize: 18.sp,
                  letterSpacing: 2.2,
                  fontFamily: GoogleFonts.lato().fontFamily,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BuildSettingOption extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final title;
  Function()? onPressed;
  BuildSettingOption({Key? key, this.title, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: GoogleFonts.lato().fontFamily),
            ),
            const Icon(Icons.arrow_forward_ios, color: primaryClr),
          ],
        ),
      ),
    );
  }
}
