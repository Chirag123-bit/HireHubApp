import 'package:flutter/material.dart';

import '../../config/Palette.dart';

InputDecoration registerInputDecoration({required String hintText}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 18.0),
    hintStyle: const TextStyle(color: Colors.black, fontSize: 18),
    hintText: hintText,
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black, width: 2),
    ),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
    errorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Palette.orange),
    ),
    focusedErrorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(width: 2.0, color: Palette.orange),
    ),
    errorStyle: const TextStyle(color: Colors.black),
  );
}

InputDecoration signInInputDecoration(
    {required String hintText, bool? filled, MaterialColor? fillColor}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 18.0),
    hintStyle: const TextStyle(fontSize: 18),
    hintText: hintText,
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(width: 2, color: Palette.lightBlue),
    ),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Palette.lightBlue),
    ),
    errorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Palette.lightBlue),
    ),
    focusedErrorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(width: 2.0, color: Palette.lightBlue),
    ),
    errorStyle: const TextStyle(color: Palette.lightBlue),
  );
}
