import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotifyScreen extends StatelessWidget {
  final String? label;
  const NotifyScreen({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Get.back(),
          ),
          title: Text(label.toString().split("|")[0]),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                label.toString().split("|")[1],
                style: const TextStyle(fontSize: 24),
              )),
        ));
  }
}
