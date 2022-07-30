import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
import 'package:just_audio/just_audio.dart';
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
  final player = AudioPlayer();
  final player2 = AudioPlayer();

  String? chatId;
  final ScrollController _scrollController = ScrollController();

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
      socket.on("message", (msg) async {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        await player.setAsset("assets/audio/incomming.mp3");
        await player.play();
        Message message = Message(
          sender: msg["senderId"],
          content: msg["message"],
          chat: chatId,
          createdAt: DateTime.now().toString(),
          updatedAt: DateTime.now().toString(),
        );
        setState(() {
          chatMessages!.add(message);
        });
        await player.play();
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
        chatId = chatD;
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
    await player2.setAsset("assets/audio/sent.mp3");

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
        "reciverId": widget.user.id,
        "message": _msgController.text
      });
      Message message = Message(
        sender: GetStorage().read("userId"),
        content: _msgController.text,
        chat: chatId,
        createdAt: DateTime.now().toString(),
        updatedAt: DateTime.now().toString(),
      );
      setState(() {
        chatMessages!.add(message);
      });
      player2.play();

      ChatsAPI api = ChatsAPI();
      api.sendMessages(chatId!, _msgController.text);
      _msgController.clear();
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
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
              radius: 10.sp,
              backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
              backgroundImage: NetworkImage(profilePic),
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
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              size: 14.sp,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
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
                            shrinkWrap: true,
                            controller: _scrollController,
                            itemCount: chatMessages!.length + 1,
                            itemBuilder: (context, index) {
                              if (index == chatMessages!.length) {
                                return Container(
                                  height: 50,
                                );
                              }
                              if (chatMessages![index].sender ==
                                  GetStorage().read("userId")) {
                                return OwnMessage(
                                  message: chatMessages![index].content!,
                                );
                              } else {
                                return ReplyMessage(
                                  message: chatMessages![index].content!,
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
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                          key: const Key("messageBox"),
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
                            hintStyle: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.grey,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.send,
                                size: 16.sp,
                              ),
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
