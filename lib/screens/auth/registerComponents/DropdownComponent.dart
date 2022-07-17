import 'package:flutter/material.dart';

class DropdownComponent extends StatefulWidget {
  final List<DropdownMenuItem<String>> items;
  String? valueHolder;
  Function onChanged;
  String? value;
  DropdownComponent(
      {Key? key,
      this.value,
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
    return Container(
      padding: const EdgeInsets.all(8),
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
        ),
        child: DropdownButtonFormField(
          hint: const Text('Select your Choice'),
          items: widget.items,
          isExpanded: true,
          value: widget.value,
          onChanged: (value) {
            widget.onChanged(value.toString());
          },
          validator: (value) {
            if (value == null) {
              return 'Please select an option';
            }
            return null;
          },
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: 'Select your Type',
            hintStyle: TextStyle(color: Colors.grey[400]),
          ),
        ),
      ),
    );
  }
}
