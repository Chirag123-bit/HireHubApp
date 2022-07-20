import 'package:flutter/material.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/utils/url.dart';

class NewContactCard extends StatelessWidget {
  User user;
  NewContactCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var profilePic = user.avatarImage;
    if (profilePic!.contains("uploads\\")) {
      profilePic = baseImgUrl + profilePic;
      profilePic = profilePic.replaceAll("\\", "/");
    }
    return ListTile(
      leading: SizedBox(
        height: 50,
        width: 50,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 30,
              child: Image.network(profilePic),
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ),
      title: Text(
        user.username!,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(user.email!, style: const TextStyle(fontSize: 13)),
    );
  }
}
