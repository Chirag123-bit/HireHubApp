import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hirehub/APIs/ChatAPI.dart';
import 'package:hirehub/models/Chat/ChattingModel.dart';
import 'package:hirehub/models/Chat/MessageModel.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/response/ChatResponse/MessageFetchResponse.dart';
import 'package:hirehub/screens/message/CustomUI/OwnMessage.dart';
import 'package:hirehub/screens/message/CustomUI/ReplyCard.dart';
import 'package:hirehub/utils/url.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class IndividualPage extends StatefulWidget {
  User user;
  Chat? chat;
  IndividualPage({Key? key, required this.user, this.chat}) : super(key: key);

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  late IO.Socket socket;
  final TextEditingController _msgController = TextEditingController();
  List<Message>? chatMessages = [];
  bool loading = false;

  String? chatId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connect();
    fetchMessages();
  }

  void connect() {
    socket = IO.io(socketUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket.connect();
    print(socket.connected);
    socket.emit("setupApp", GetStorage().read("userId"));
    socket.onConnect((data) {
      print("Connected");
      socket.on("message", (msg) {
        print(msg);
      });
    });
  }

  void fetchMessages() async {
    ChatsAPI api = ChatsAPI();

    setState(() {
      loading = true;
    });

    if (widget.chat == null) {
      String? chatD = await api.getChatId(widget.user.id!);
      if (chatD == null) {
        Get.snackbar(
          "Error",
          "Something went wrong",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
        );
        return;
      } else {
        setState(() {
          chatId = chatD;
        });
      }
    } else {
      chatId = widget.chat!.id!;
    }
    FetchMessagesResponse? messages = await api.getMessages(chatId!);
    List<Message>? messageList = messages?.messages;
    setState(() {
      chatMessages = messageList;
      loading = false;
    });
  }

  void sendMessage() async {
    if (_msgController.text.isEmpty) {
      Get.snackbar(
        'Message',
        'Please enter a message',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(Icons.error, color: Colors.white),
      );
      return;
    } else {
      socket.emit("message", {
        "senderId": GetStorage().read("userId"),
        "receiverId": widget.user.id,
        "message": _msgController.text
      });

      ChatsAPI api = ChatsAPI();
      api.sendMessages(chatId!, _msgController.text);
      _msgController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    var profilePic = widget.user.avatarImage;
    if (profilePic!.contains("uploads\\")) {
      profilePic = baseImgUrl + profilePic;
      profilePic = profilePic.replaceAll("\\", "/");
    }
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 70,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(
              Icons.arrow_back,
              size: 24,
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
              child: Image.network(profilePic),
            )
          ]),
        ),
        title: Container(
          margin: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.user.firstName! + " " + widget.user.lastName!,
                style: const TextStyle(
                  fontSize: 18.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 140,
                child: loading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : chatMessages!.isEmpty
                        ? const Center(
                            child: Text(
                              "No messages yet",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          )
                        : ListView.builder(
                            itemCount: chatMessages!.length,
                            itemBuilder: (context, index) {
                              Message message = chatMessages![index];
                              if (message.sender ==
                                  GetStorage().read("userId")) {
                                return OwnMessage(
                                  message: message.content!,
                                );
                              } else {
                                return ReplyMessage(
                                  message: message.content!,
                                );
                              }
                            }),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 15,
                      child: Card(
                        margin:
                            const EdgeInsets.only(left: 2, right: 2, bottom: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: TextFormField(
                          controller: _msgController,
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          minLines: 1,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Type a message...",
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 30),
                            hintStyle: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.send),
                              onPressed: () {
                                sendMessage();
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
