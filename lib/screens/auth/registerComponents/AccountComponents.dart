import 'package:flutter/material.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/screens/auth/registerComponents/DropdownComponent.dart';

class AccountComponents extends StatefulWidget {
  User user;
  AccountComponents({Key? key, required this.user}) : super(key: key);

  @override
  State<AccountComponents> createState() => _AccountComponentsState();
}

class _AccountComponentsState extends State<AccountComponents> {
  String? applicantType = "Applicant";

  List<DropdownMenuItem<String>> typeOptions = const [
    DropdownMenuItem(
      child: Text('Applicant'),
      value: "Applicant",
    ),
    DropdownMenuItem(
      child: Text('Company'),
      value: "Company",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        DropdownComponent(items: typeOptions, valueHolder: applicantType),
        const SizedBox(height: 15),
        TextFormField(
          initialValue: widget.user.email ?? "",
          onChanged: (value) {
            setState(() {
              widget.user.email = value;
            });
          },
          decoration: const InputDecoration(
              labelText: 'Email Address',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.black, width: 0.5),
              ),
              border: OutlineInputBorder()),
        ),
        const SizedBox(height: 15),
        TextFormField(
          initialValue: widget.user.username ?? "",
          onChanged: (value) {
            setState(() {
              widget.user.username = value;
            });
          },
          decoration: const InputDecoration(
              labelText: 'Username',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.black, width: 0.5),
              ),
              border: OutlineInputBorder()),
        ),
        const SizedBox(height: 15),
        TextFormField(
          initialValue: widget.user.password ?? "",
          onChanged: (value) {
            setState(() {
              widget.user.password = value;
            });
          },
          obscureText: true,
          obscuringCharacter: "*",
          decoration: const InputDecoration(
              labelText: 'Password',
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
