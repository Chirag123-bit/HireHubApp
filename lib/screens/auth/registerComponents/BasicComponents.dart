import 'package:flutter/material.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/screens/auth/TextComponent.dart';
import 'package:hirehub/screens/auth/registerComponents/DropdownComponent.dart';

// ignore: must_be_immutable
class BasicComponents extends StatefulWidget {
  User user;
  TextEditingController firstnameController;
  TextEditingController lastnameController;
  TextEditingController phoneController;
  List<GlobalKey<FormState>> formKeys;
  @override
  State<BasicComponents> createState() => _BasicComponentsState();
  BasicComponents({
    Key? key,
    required this.user,
    required this.firstnameController,
    required this.lastnameController,
    required this.phoneController,
    required this.formKeys,
  }) : super(key: key);
}

class _BasicComponentsState extends State<BasicComponents> {
  String? genderType = "Male";

  List<DropdownMenuItem<String>> genderOptions = const [
    DropdownMenuItem(
      child: Text('Male'),
      value: "Male",
    ),
    DropdownMenuItem(
      child: Text('Female'),
      value: "Female",
    ),
    DropdownMenuItem(
      child: Text('Others'),
      value: "Others",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: widget.formKeys[0],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const Spacer(),
            const SizedBox(height: 15),
            Row(children: [
              Flexible(
                child: TextFieldGenerator(
                  label: "First Name",
                  controller: widget.firstnameController,
                  keyboardType: TextInputType.text,
                  validatorText: "First Name is required",
                ),
              ),
              Flexible(
                child: TextFieldGenerator(
                  label: "Last Name",
                  controller: widget.lastnameController,
                  keyboardType: TextInputType.text,
                  validatorText: "Last Name is required",
                ),
              )
            ]),
            const SizedBox(height: 15),
            DropdownComponent(
              items: genderOptions,
              valueHolder: widget.user.gender,
              onChanged: (value) {
                setState(
                  () {
                    widget.user.gender = value;
                  },
                );
              },
            ),
            const SizedBox(height: 15),
            TextFieldGenerator(
              label: "Phone Number",
              controller: widget.phoneController,
              keyboardType: TextInputType.number,
              validatorText: "Phone Number is required",
            ),
          ],
        ),
      ),
    );
  }
}
