import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/utils/url.dart';

class NewContactCard extends StatelessWidget {
  User user;
  NewContactCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    var profilePic = user.avatarImage;
    if (profilePic!.contains("uploads\\")) {
      profilePic = baseImgUrl + profilePic;
      profilePic = profilePic.replaceAll("\\", "/");
    }
    return ListTile(
      leading: SizedBox(
        height: 50.sp,
        width: 50.sp,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 30.sp,
              child: Image.network(profilePic),
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ),
      title: Text(
        user.username!,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(user.email!, style: TextStyle(fontSize: 13.sp)),
    );
  }
}
