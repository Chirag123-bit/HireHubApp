import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/repository/UserRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  late User user;
  late UserRepository _userRepository;
  bool isLoading = true;
  var fname;

  void getAndSetDate() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _userRepository = UserRepository();
    user = await _userRepository.getBasicUserDetails();
    fname = user.firstName;
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getAndSetDate();
  }

  @override
  Widget build(BuildContext context) {
    //  var logo = widget.user.company!.avatarImage;

    // if (logo!.contains("uploads\\")) {
    //   logo = baseImgUrl + logo;
    //   logo = logo.replaceAll("\\", "/");
    // }
    return Padding(
      key: const Key('homeBanner'),
      padding: EdgeInsets.symmetric(
        horizontal: kSpacingUnit * 3,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(
                radius: kSpacingUnit * 2,
                backgroundImage: const AssetImage('assets/images/avatar.png'),
              ),
            ],
          ),
          RichText(
            text: TextSpan(
              style: kHeadingTextStyle.copyWith(
                color: Get.isDarkMode ? Colors.white : Colors.grey[600],
              ),
              children: [
                isLoading
                    ? const TextSpan(text: "Loading...")
                    : TextSpan(text: 'Hey $fname, \n'),
                const TextSpan(
                  text: 'Looking for Jobs?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
