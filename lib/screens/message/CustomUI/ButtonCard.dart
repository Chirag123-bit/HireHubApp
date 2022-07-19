import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  String name;
  IconData icon;
  ButtonCard({Key? key, required this.name, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: CircleAvatar(
            radius: 30,
            child: Icon(
              icon,
              size: 28,
            ),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white),
        title: Text(
          name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle:
            const Text("Full Stack Developer", style: TextStyle(fontSize: 13)),
      ),
    );
  }
}
