import 'package:flutter/material.dart';
import 'package:hirehub/models/Chat/ChatModel.dart';
import 'package:hirehub/screens/message/CustomUI/ButtonCard.dart';
import 'package:hirehub/screens/message/CustomUI/ContactCard.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({Key? key}) : super(key: key);

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  //generate list of random chatmodel objects
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
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Select Contact',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '265 Contacts',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: chats.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return ButtonCard(name: "New Group", icon: Icons.group);
          } else if (index == 1) {
            return ButtonCard(
              name: "New Message",
              icon: Icons.message,
            );
          } else {
            return const ContactCard();
          }
        },
      ),
    );
  }
}
