import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  IconData? suffixIcon;
  final IconData? prefixIcon;
  final TextEditorController? textEditorController;
  final bool? isObscure;
  final String? hintText;
  CustomTextField({
    Key? key,
    this.suffixIcon,
    this.textEditorController,
    this.isObscure = false,
    this.hintText,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: Row(
        children: [
          Icon(
            prefixIcon,
            color: Colors.white,
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: TextField(
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              obscureText: isObscure!,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextEditorController {}
