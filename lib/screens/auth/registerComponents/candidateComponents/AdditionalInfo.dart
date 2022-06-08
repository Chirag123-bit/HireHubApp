import 'package:flutter/material.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/screens/auth/registerComponents/DropdownComponent.dart';

class AdditionalInfo extends StatefulWidget {
  User user;
  AdditionalInfo({Key? key, required this.user}) : super(key: key);

  @override
  State<AdditionalInfo> createState() => _AdditionalInfoState();
}

class _AdditionalInfoState extends State<AdditionalInfo> {
  List<DropdownMenuItem<String>> jobOptions = const [
    DropdownMenuItem(
      child: Text('Information Technology'),
      value: "Information Technology",
    ),
    DropdownMenuItem(
      child: Text('Healthcare'),
      value: "Health",
    ),
    DropdownMenuItem(
      child: Text('Entertainment'),
      value: "Entertainment",
    ),
    DropdownMenuItem(
      child: Text('Real Estate'),
      value: "Real Estate",
    ),
    DropdownMenuItem(
      child: Text('Finance'),
      value: "Finance",
    ),
  ];

  String? jobType = "Information Technology";

  @override
  void initState() {
    super.initState();
    widget.user.skills = List<String>.empty(growable: true);
    widget.user.skills!.add("");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        TextFormField(
          initialValue: widget.user.title ?? "",
          onChanged: (value) {
            setState(() {
              widget.user.title = value;
            });
          },
          decoration: const InputDecoration(
              labelText: 'Prefered Job Title',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.black, width: 0.5),
              ),
              border: OutlineInputBorder()),
        ),
        const SizedBox(height: 15),
        DropdownComponent(items: jobOptions, valueHolder: jobType),
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
        _skillsContainer(),
      ],
    );
  }

  Widget skillUi(int index) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(children: [
        Flexible(
          child: TextFormField(
            // initialValue: widget.user.skills[index] ?? "",
            onChanged: (value) {
              setState(() {
                widget.user.skills![index] = value;
              });
            },
            decoration: InputDecoration(
                labelText: 'Skill $index',
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.black, width: 0.5),
                ),
                border: const OutlineInputBorder()),
          ),
        ),
        Visibility(
          child: SizedBox(
            width: 35,
            child: IconButton(
              icon: const Icon(
                Icons.add_circle,
                color: Colors.orange,
              ),
              onPressed: () {
                addEmailControl();
              },
            ),
          ),
          visible: index == widget.user.skills!.length - 1,
        ),
        Visibility(
          child: SizedBox(
            width: 35,
            child: IconButton(
              icon: const Icon(
                Icons.remove_circle,
                color: Colors.black,
              ),
              onPressed: () {
                removeEmailControl(index);
              },
            ),
          ),
          visible: index > 0,
        ),
      ]),
    );
  }

  Widget _skillsContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "Skill(s)",
          textAlign: TextAlign.left,
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: widget.user.skills!.length,
          itemBuilder: (context, index) {
            return Column(children: [
              skillUi(index),
            ]);
          },
          separatorBuilder: (context, index) => const Divider(),
        )
      ],
    );
  }

  void addEmailControl() {
    setState(() {
      widget.user.skills!.add("");
    });
  }

  void removeEmailControl(int index) {
    setState(() {
      if (widget.user.skills!.length > 1) {
        widget.user.skills!.removeAt(index);
      }
    });
  }
}
