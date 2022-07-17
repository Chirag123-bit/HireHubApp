import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final int index;
  const IconText(this.icon, this.text, this.index);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: index == 1 ? Colors.white : Colors.black,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: index == 1 ? Colors.white : Colors.black,
          ),
        )
      ],
    );
  }
}
