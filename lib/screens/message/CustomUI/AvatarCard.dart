import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirehub/models/Chat/ChatModel.dart';

class AvatarCard extends StatelessWidget {
  ChatModel chat;
  AvatarCard({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 23,
                child: Image.asset(
                  "assets/icons/real.png",
                ),
                backgroundColor: Colors.grey,
              ),
              const Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                    backgroundColor: Colors.teal,
                    radius: 11,
                    child: Icon(Icons.clear, color: Colors.white, size: 13)),
              )
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Text(chat.name,
              style: TextStyle(
                  fontSize: 12,
                  color: Get.isDarkMode ? Colors.white : Colors.black)),
        ],
      ),
    );
  }
}
