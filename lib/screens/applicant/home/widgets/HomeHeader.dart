import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/Users.dart';

class HomeHeader extends StatelessWidget {
  final User user;
  const HomeHeader({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  var logo = widget.user.company!.avatarImage;
    var fname = user.firstName;
    // if (logo!.contains("uploads\\")) {
    //   logo = baseImgUrl + logo;
    //   logo = logo.replaceAll("\\", "/");
    // }
    return Padding(
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
                TextSpan(text: 'Hey $fname, \n'),
                const TextSpan(
                  text: 'Looking to Hire?',
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
