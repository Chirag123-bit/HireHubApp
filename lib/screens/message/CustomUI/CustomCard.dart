import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirehub/Logic/ChatLogic.dart';
import 'package:hirehub/models/Chat/ChattingModel.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/screens/message/Pages/IndividualPage.dart';
import 'package:hirehub/utils/url.dart';
import 'package:intl/intl.dart';

class CustomCard extends StatelessWidget {
  Chat chat;
  CustomCard({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime date;
    String dateString;

    try {
      date = DateTime.parse(chat.latestMessage!.createdAt!);
    } catch (e) {
      date = DateTime.now();
      print(e);
    }

    dateString = DateFormat('MMM d, yyyy').format(date);

    User sender = getSender(chat.users!);

    var profilePic = sender.avatarImage;
    if (profilePic!.contains("uploads\\")) {
      profilePic = baseImgUrl + profilePic;
      profilePic = profilePic.replaceAll("\\", "/");
    }

    return InkWell(
      onTap: () {
        Get.to(() => IndividualPage(
              user: sender,
              chat: chat,
            ));
      },
      key: Key(sender.firstName! + "key"),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(profilePic),
              backgroundColor: Colors.white,
            ),
            title: Text(
              sender.firstName! + " " + sender.lastName!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Row(
              children: [
                const Icon(Icons.done_all),
                const SizedBox(width: 3),
                Text(
                  chat.latestMessage?.content ?? " ",
                  style: const TextStyle(fontSize: 13),
                ),
              ],
            ),
            trailing: Text(dateString),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20, left: 80),
            child: Divider(
              thickness: 1,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
