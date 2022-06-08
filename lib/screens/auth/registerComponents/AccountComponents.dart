import 'package:flutter/material.dart';

class AccountComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        TextFormField(
          decoration: const InputDecoration(
              labelText: 'Type',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.black, width: 0.5),
              ),
              border: OutlineInputBorder()),
        ),
        const SizedBox(height: 15),
        TextFormField(
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
