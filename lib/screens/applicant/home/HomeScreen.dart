import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/repository/UserRepository.dart';
import 'package:hirehub/screens/applicant/home/widgets/HomeContent.dart';
import 'package:hirehub/screens/applicant/home/widgets/HomeHeader.dart';
import 'package:hirehub/screens/applicant/home/widgets/HomeSubHeader.dart';
import 'package:hirehub/theme/Theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  bool isUpdating = false;
  bool isImageLoading = false;
  late String _imageUrl;
  late SharedPreferences prefs;
  late User user;
  late UserRepository _userRepository;

  void getAndSetDate() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _userRepository = UserRepository();
    user = await _userRepository.getBasicUserDetails();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //get user from shared prefs
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
            HomeHeader(user: user),
            SizedBox(height: kSpacingUnit * 3),
            const HomeSubHeader(),
            SizedBox(height: kSpacingUnit * 3),
            const HomeContent(),
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
