import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirehub/models/Chat/ChatModel.dart';
import 'package:hirehub/screens/message/CustomUI/AvatarCard.dart';
import 'package:hirehub/screens/message/CustomUI/ContactCard.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
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
  List<ChatModel> selectedChats = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'New Group',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Add Participants',
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
      body: Stack(
        children: [
          ListView.builder(
            itemCount: chats.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return SizedBox(
                    height: selectedChats.isNotEmpty ? 100 : 10,
                    child: const Text(""));
              }
              return InkWell(
                onTap: () {
                  setState(() {
                    if (chats[index - 1].select) {
                      selectedChats.remove(chats[index - 1]);
                      chats[index - 1].select = false;
                    } else {
                      selectedChats.add(chats[index - 1]);
                      chats[index - 1].select = true;
                    }
                  });
                },
                child: ContactCard(
                  chat: chats[index - 1],
                ),
              );
            },
          ),
          selectedChats.isNotEmpty
              ? Column(
                  children: [
                    Container(
                      height: 75,
                      width: MediaQuery.of(context).size.width,
                      color: Get.isDarkMode
                          ? const Color.fromARGB(255, 77, 76, 76)
                          : Colors.white,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: chats.length,
                        itemBuilder: (context, index) {
                          if (chats[index].select) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedChats[index].select = false;
                                  selectedChats.remove(selectedChats[index]);
                                });
                              },
                              child: AvatarCard(chat: chats[index]),
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                    )
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
