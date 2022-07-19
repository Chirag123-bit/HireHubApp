import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirehub/models/Chat/ChatModel.dart';
import 'package:hirehub/screens/message/Pages/IndividualPage.dart';

class CustomCard extends StatelessWidget {
  ChatModel chat;
  CustomCard({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => IndividualPage(
              chat: chat,
            ));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Image.asset("assets/icons/real.png"),
              backgroundColor: Colors.white,
            ),
            title: Text(
              chat.name,
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
                  chat.currentMessage,
                  style: const TextStyle(fontSize: 13),
                ),
              ],
            ),
            trailing: Text(chat.time),
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
