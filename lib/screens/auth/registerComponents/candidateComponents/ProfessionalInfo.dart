import 'package:flutter/material.dart';
import 'package:hirehub/models/Users.dart';

class ProfessionalInfo extends StatefulWidget {
  User user;
  ProfessionalInfo({Key? key, required this.user}) : super(key: key);

  @override
  State<ProfessionalInfo> createState() => _ProfessionalInfoState();
}

class _ProfessionalInfoState extends State<ProfessionalInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        SizedBox(
          height: 100,
          child: TextFormField(
            initialValue: widget.user.summary ?? "",
            onChanged: (value) {
              setState(() {
                widget.user.summary = value;
              });
            },
            expands: true,
            maxLines: null,
            decoration: const InputDecoration(
                labelText: 'About Yourself',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.black, width: 0.5),
                ),
                border: OutlineInputBorder()),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 100,
          child: TextFormField(
            initialValue: widget.user.summary ?? "",
            onChanged: (value) {
              setState(() {
                widget.user.summary = value;
              });
            },
            expands: true,
            maxLines: null,
            decoration: const InputDecoration(
                labelText: 'About Yourself',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.black, width: 0.5),
                ),
                border: OutlineInputBorder()),
          ),
        ),
      ],
    );
  }
}
