import 'package:flutter/material.dart';

class ExperienceLevelWidget extends StatefulWidget {
  const ExperienceLevelWidget({
    Key? key,
  }) : super(key: key);

  @override
  _ExperienceLevelWidgetState createState() => _ExperienceLevelWidgetState();
}

class _ExperienceLevelWidgetState extends State<ExperienceLevelWidget> {
  int _active = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                _active = 0;
              });
            },
            child: Text(
              "Entry Level",
              style: _active == 0
                  ? Theme.of(context)
                      .textTheme
                      .headline1!
                      .apply(color: Colors.blue)
                  : Theme.of(context)
                      .textTheme
                      .headline6!
                      .apply(color: Colors.grey),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _active = 1;
              });
            },
            child: Text(
              "Mid Level",
              style: _active == 1
                  ? Theme.of(context)
                      .textTheme
                      .headline1!
                      .apply(color: Colors.blue)
                  : Theme.of(context)
                      .textTheme
                      .headline2!
                      .apply(color: Colors.grey),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _active = 2;
              });
            },
            child: Text(
              "Senior Level",
              style: _active == 2
                  ? Theme.of(context)
                      .textTheme
                      .headline1!
                      .apply(color: Colors.blue)
                  : Theme.of(context)
                      .textTheme
                      .headline2!
                      .apply(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
