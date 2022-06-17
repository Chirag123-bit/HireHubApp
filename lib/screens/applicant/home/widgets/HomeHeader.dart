import 'package:flutter/material.dart';
import 'package:hirehub/config/Constants.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              style: kHeadingTextStyle,
              children: const [
                TextSpan(text: 'Hey Chirag, \n'),
                TextSpan(
                  text: 'Looking for a Job?',
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
