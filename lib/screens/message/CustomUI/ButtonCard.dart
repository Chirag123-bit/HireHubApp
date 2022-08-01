import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonCard extends StatelessWidget {
  String name;
  IconData icon;

  ButtonCard({Key? key, required this.name, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ListTile(
      leading: CircleAvatar(
          radius: 25.sp,
          child: Icon(
            icon,
            size: 20.sp,
          ),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white),
      title: Text(
        name,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: const Text(""),
    );
  }
}
