import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirehub/models/Chat/ChatModel.dart';
import 'package:hirehub/screens/message/CustomUI/CustomCard.dart';
import 'package:hirehub/screens/message/Pages/SelectContacts.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
      name: 'Chirag Simkhada',
      icon: 'assets/icons/real.png',
      isGroup: false,
      time: '5:55',
      currentMessage: 'Hello how are you?',
    ),
    ChatModel(
      name: 'Random User',
      icon: 'assets/icons/real.png',
      isGroup: false,
      time: '5:55',
      currentMessage: 'You are a good person',
    ),
    ChatModel(
      name: 'Test User',
      icon: 'assets/icons/real.png',
      isGroup: false,
      time: '5:55',
      currentMessage: 'Yo',
    ),
    ChatModel(
      name: 'Google Inc',
      icon: 'assets/icons/real.png',
      isGroup: false,
      time: '5:55',
      currentMessage: 'Whats up?',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Get.theme.primaryColor,
        onPressed: () {
          Get.to(() => const SelectContact());
        },
        child: Icon(Icons.chat,
            color: Get.isDarkMode ? Colors.white : Colors.black),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return CustomCard(
            chat: chats[index],
          );
        },
      ),
    );
  }
}
