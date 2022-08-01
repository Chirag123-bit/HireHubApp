import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReplyMessage extends StatelessWidget {
  String? message;
  ReplyMessage({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
          minWidth: MediaQuery.of(context).size.height * 0.2,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          color: Get.isDarkMode
              ? const Color.fromARGB(255, 20, 181, 106)
              : const Color.fromARGB(255, 13, 98, 75),
          child: Stack(children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 20),
              child: Text(
                message ??
                    "Hey Hey Hey Hey Hey Hey Hey Hey Hey Hey Hey Hey Hey Hey Hey Hey Hey Hey Hey Hey Hey Hey Hey Hey Hey Hey Hey",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 4,
              child: Text(
                "20:50",
                style: TextStyle(fontSize: 8.sp, color: Colors.grey[200]),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
