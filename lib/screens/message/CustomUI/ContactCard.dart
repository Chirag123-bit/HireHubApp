import 'package:flutter/material.dart';
import 'package:hirehub/models/Chat/ChatModel.dart';

class ContactCard extends StatelessWidget {
  ChatModel chat;
  ContactCard({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 30,
            child: Image.asset("assets/icons/real.png"),
            backgroundColor: Colors.white,
          ),
          const Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
                backgroundColor: Colors.teal,
                radius: 11,
                child: Icon(Icons.check, color: Colors.white, size: 20)),
          ),
        ],
      ),
      title: const Text(
        'John Doe',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle:
          const Text("Full Stack Developer", style: TextStyle(fontSize: 13)),
    );
  }
}
