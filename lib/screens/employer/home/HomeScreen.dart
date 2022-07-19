import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/repository/UserRepository.dart';
import 'package:hirehub/screens/employer/home/widgets/HomeContent.dart';
import 'package:hirehub/screens/employer/home/widgets/HomeHeader.dart';
import 'package:hirehub/theme/Theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  bool isUpdating = false;
  bool isImageLoading = false;
  late String _imageUrl;
  late SharedPreferences prefs;
  late User user;
  late Image profilePic;
  late Image logo;
  late UserRepository _userRepository;

  void getAndSetDate() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _userRepository = UserRepository();
    user = await _userRepository.getBasicUserDetails();
    String prof = await _userRepository.getProfileFromPreferences();
    profilePic = _userRepository.imageFromBase64String(prof);
    String log = await _userRepository.getLogoFromPreferences();
    logo = _userRepository.imageFromBase64String(log);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAndSetDate();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isLoading
                ? Container(
                    color: Colors.white,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : HomeHeader(user: user, profilePic: profilePic),
            SizedBox(height: kSpacingUnit * 3),
            HomeContent(),
          ],
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   detector.stopListening();
  //   super.dispose();
  // }
}
