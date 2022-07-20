import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnMessage extends StatelessWidget {
  const OwnMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.6,
          minWidth: MediaQuery.of(context).size.height * 0.2,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          color: Get.isDarkMode
              ? const Color.fromARGB(255, 22, 85, 167)
              : const Color.fromARGB(255, 116, 34, 230),
          child: Stack(children: [
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 20),
              child: Text(
                "Hey",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                right: 4,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "20:50",
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.done_all,
                        size: 20,
                      )
                    ]))
          ]),
        ),
      ),
    );
  }
}