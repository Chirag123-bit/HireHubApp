import 'package:flutter/material.dart';

class TextFieldGenerator extends StatelessWidget {
  TextFieldGenerator(
      {Key? key,
      required this.label,
      required this.controller,
      required this.keyboardType,
      this.obscureText = false,
      required this.validatorText,
      this.readOnly = false,
      this.border = const OutlineInputBorder()})
      : super(key: key);

  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String validatorText;
  final InputBorder border;
  bool obscureText;
  bool readOnly;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        readOnly: readOnly,
        decoration: InputDecoration(
            filled: true, labelText: label, border: const OutlineInputBorder()),
        validator: (value) {
          if (value!.isEmpty) {
            return validatorText;
          }
          return null;
        },
      ),
    );
  }
}
