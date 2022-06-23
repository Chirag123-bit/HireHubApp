import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/screens/applicant/todo/TodoScreen.dart';
import 'package:hirehub/services/notification_services.dart';
import 'package:hirehub/services/theme_services.dart';
import 'package:hirehub/theme/Theme.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  var notifyHelper;
  bool isDarkMode = Get.isDarkMode;

  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 25),
        child: ListView(
          children: [
            Text(
              "Settings",
              style: titleStyle.copyWith(
                  fontSize: 24, fontFamily: GoogleFonts.lato().fontFamily),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dark Mode",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.lato().fontFamily),
                ),
                Transform.scale(
                  scale: 0.7,
                  child: CupertinoSwitch(
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
                const Icon(
                  Icons.person,
                  color: primaryClr,
                ),
                const SizedBox(width: 8),
                Text(
                  "Account",
                  style: kTitleStyle.copyWith(
                      fontSize: 18,
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
              onPressed: () {},
            ),
            BuildSettingOption(title: "Professional Info", onPressed: () {}),
            BuildSettingOption(title: "Educational Records", onPressed: () {}),
            BuildSettingOption(title: "Experience Records", onPressed: () {}),
            BuildSettingOption(title: "Change Password", onPressed: () {}),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const Icon(
                  Icons.person_pin,
                  color: primaryClr,
                ),
                const SizedBox(width: 8),
                Text(
                  "Personal Space",
                  style: kTitleStyle.copyWith(
                      fontSize: 18,
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
                  await Get.to(() => const TodoScreen());
                }),
            BuildSettingOption(title: "My ToDos", onPressed: () {}),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)))),
              onPressed: () {},
              child: Text(
                "Sign Out",
                style: TextStyle(
                  fontSize: 18,
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
                  fontSize: 18,
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
