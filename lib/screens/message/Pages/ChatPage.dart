import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirehub/APIs/ChatAPI.dart';
import 'package:hirehub/models/Chat/ChattingModel.dart';
import 'package:hirehub/response/ChatResponse/FetchChatResponse.dart';
import 'package:hirehub/screens/message/CustomUI/CustomCard.dart';
import 'package:hirehub/screens/message/Pages/SelectContacts.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Chat>? userChats = [];
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchChats();
  }

  fetchChats() async {
    setState(() {
      loading = true;
    });
    ChatsAPI api = ChatsAPI();
    FetchChatResponse? chats = await api.getChats();
    List<Chat>? chatList = chats?.chats;
    setState(() {
      userChats = chatList;
      loading = false;
    });
  }

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
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : userChats == null
              ? const Center(
                  child: Text("No Chats"),
                )
              : ListView.builder(
                  itemCount: userChats!.length,
                  itemBuilder: (context, index) {
                    return CustomCard(
                      chat: userChats![index],
                    );
                  },
                ),
    );
  }
}
