import 'package:flutter/material.dart';
import 'package:hirehub/theme/Theme.dart';

class EditBasicInfoScreen extends StatefulWidget {
  const EditBasicInfoScreen({Key? key}) : super(key: key);

  @override
  State<EditBasicInfoScreen> createState() => _EditBasicInfoScreenState();
}

class _EditBasicInfoScreenState extends State<EditBasicInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Container(
          child: ListView(
        children: [
          Text(
            "Edit Profile",
            style: titleStyle,
          )
        ],
      )),
    );
  }
}
