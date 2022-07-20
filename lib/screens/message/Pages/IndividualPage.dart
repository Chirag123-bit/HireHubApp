import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/screens/message/CustomUI/OwnMessage.dart';
import 'package:hirehub/screens/message/CustomUI/ReplyCard.dart';
import 'package:hirehub/utils/url.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class IndividualPage extends StatefulWidget {
  User user;
  IndividualPage({Key? key, required this.user}) : super(key: key);

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  late IO.Socket socket;
  final TextEditingController _msgController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connect();
    print(GetStorage().read("userId"));
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

  void sendMessage() {
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
      _msgController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
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
              const Text(
                "Last Seen: 10:45",
                style: TextStyle(
                  fontSize: 11,
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
                child: ListView(
                  shrinkWrap: true,
                  children: const [
                    OwnMessage(),
                    ReplyMessage(),
                    OwnMessage(),
                    ReplyMessage(),
                    OwnMessage(),
                    ReplyMessage(),
                    OwnMessage(),
                    ReplyMessage(),
                    OwnMessage(),
                    ReplyMessage(),
                  ],
                ),
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
