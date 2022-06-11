import 'package:flutter/material.dart';

class DropdownComponent extends StatefulWidget {
  final List<DropdownMenuItem<String>> items;
  String? valueHolder;
  Function onChanged;
  DropdownComponent(
      {Key? key,
      required this.items,
      required this.valueHolder,
      required this.onChanged})
      : super(key: key);

  @override
  State<DropdownComponent> createState() => _DropdownComponentState();
}

class _DropdownComponentState extends State<DropdownComponent> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      hint: const Text('Select your Type'),
      items: widget.items,
      isExpanded: true,
      value: widget.valueHolder ?? widget.items[0].value,
      onChanged: (value) {
        widget.onChanged(value.toString());
      },
    );
  }
}
