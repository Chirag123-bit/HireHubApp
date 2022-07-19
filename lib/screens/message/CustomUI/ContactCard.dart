import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Image.asset("assets/icons/real.png"),
          backgroundColor: Colors.white,
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
      ),
    );
  }
}
