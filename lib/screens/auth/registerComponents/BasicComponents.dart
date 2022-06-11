import 'package:flutter/material.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/screens/auth/registerComponents/DropdownComponent.dart';

class BasicComponents extends StatefulWidget {
  User user;
  @override
  State<BasicComponents> createState() => _BasicComponentsState();
  BasicComponents({Key? key, required this.user}) : super(key: key);
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
    return Column(
      children: [
        const SizedBox(height: 15),
        TextFormField(
          initialValue: widget.user.firstName ?? "",
          onChanged: (value) {
            setState(() {
              widget.user.firstName = value;
            });
          },
          decoration: const InputDecoration(
              labelText: 'First Name',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.black, width: 0.5),
              ),
              border: OutlineInputBorder()),
        ),
        const SizedBox(height: 15),
        TextFormField(
          initialValue: widget.user.lastName ?? "",
          onChanged: (value) {
            setState(() {
              widget.user.lastName = value;
            });
          },
          decoration: const InputDecoration(
              labelText: 'Last Name',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.black, width: 0.5),
              ),
              border: OutlineInputBorder()),
        ),
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
        TextFormField(
          initialValue: widget.user.phone ?? "",
          onChanged: (value) {
            setState(() {
              widget.user.phone = value;
            });
          },
          decoration: const InputDecoration(
              labelText: 'Phone',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.black, width: 0.5),
              ),
              border: OutlineInputBorder()),
        ),
      ],
    );
  }
}
