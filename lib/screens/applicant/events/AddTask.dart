import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirehub/controller/EventController.dart';
import 'package:hirehub/models/Events.dart';
import 'package:hirehub/screens/widgets/Button.dart';
import 'package:hirehub/screens/widgets/InputField.dart';
import 'package:hirehub/theme/Theme.dart';
import 'package:intl/intl.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final EventController _eventController = Get.put(EventController());
  DateTime selectedDate = DateTime.now();
  String startTime = DateFormat('HH:mm a').format(DateTime.now());
  String endTime = "9:30 PM";
  int selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20];
  String selectedRepeat = "None";
  List<String> repeatList = ["None", "Daily", "Weekly", "Monthly"];
  int selectedColor = 0;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Add Task", style: headingStyle),
              MyInputField(
                  hint: "Enter Your title",
                  title: "Title",
                  controller: _titleController),
              MyInputField(
                hint: "Enter Your Note",
                title: "Note",
                controller: _noteController,
              ),
              MyInputField(
                hint: DateFormat.yMd().format(selectedDate),
                title: "Date",
                widget: IconButton(
                  onPressed: () {
                    _getDateFromUser();
                  },
                  icon: const Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: MyInputField(
                      title: "Start Time",
                      hint: startTime,
                      widget: IconButton(
                        onPressed: () {
                          _getTimeFromUser(isStartTime: true);
                        },
                        icon: const Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: MyInputField(
                      title: "End Time",
                      hint: endTime,
                      widget: IconButton(
                        onPressed: () {
                          _getTimeFromUser(isStartTime: false);
                        },
                        icon: const Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              MyInputField(
                hint: "$selectedRemind minutes early",
                title: "Remind",
                widget: DropdownButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  iconSize: 32,
                  elevation: 4,
                  style: subTitleStyle,
                  underline: Container(
                    height: 0,
                  ),
                  items: remindList.map((remind) {
                    return DropdownMenuItem(
                      value: remind,
                      child: Text("$remind minutes early"),
                    );
                  }).toList(),
                  onChanged: (int? value) {
                    if (value != null) {
                      setState(() {
                        selectedRemind = value;
                      });
                    }
                  },
                ),
              ),
              MyInputField(
                hint: selectedRepeat,
                title: "Repeat",
                widget: DropdownButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  iconSize: 32,
                  elevation: 4,
                  style: subTitleStyle,
                  underline: Container(
                    height: 0,
                  ),
                  items: repeatList.map((repeat) {
                    return DropdownMenuItem(
                      value: repeat,
                      child: Text(repeat),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    if (value != null) {
                      setState(() {
                        selectedRepeat = value;
                      });
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _colorPalate(),
                  MyButton(
                      label: "Create Task",
                      onTap: () {
                        if (_validateData()) {
                          _addEvent();
                          Get.back();
                        }
                      })
                ],
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  _addEvent() async {
    int value = await _eventController.addEvent(
      event: Event(
        title: _titleController.text,
        note: _noteController.text,
        date: DateFormat.yMd().format(selectedDate),
        startTime: startTime,
        endTime: endTime,
        remind: selectedRemind,
        repeat: selectedRepeat,
        color: selectedColor,
        isCompleted: 0,
      ),
    );
    print("The id is $value");
  }

  _validateData() {
    if (_titleController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter title",
        snackPosition: SnackPosition.BOTTOM,
        icon: const Icon(Icons.warning),
      );
      return false;
    }
    if (_noteController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter note",
        icon: const Icon(Icons.warning),
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
    if (selectedDate == null) {
      Get.snackbar("Error", "Please select date",
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
    if (startTime == null) {
      Get.snackbar("Error", "Please select start time",
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
    if (endTime == null) {
      Get.snackbar("Error", "Please select end time",
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
    if (selectedRemind == null) {
      Get.snackbar("Error", "Please select remind",
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
    if (selectedRepeat == null) {
      Get.snackbar("Error", "Please select repeat",
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
    if (selectedColor == null) {
      Get.snackbar("Error", "Please select color",
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
    return true;
  }

  _colorPalate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Color", style: titleStyle),
        const SizedBox(
          height: 8,
        ),
        Wrap(
          children: List<Widget>.generate(
            3,
            (int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColor = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: index == 0
                        ? primaryClr
                        : index == 1
                            ? pinkClr
                            : yellowClr,
                    child: selectedColor == index
                        ? const Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 16,
                          )
                        : Container(),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: const Icon(
          Icons.arrow_back_ios,
          size: 20,
        ),
      ),
      actions: const [
        CircleAvatar(
          backgroundImage: AssetImage("assets/images/profile.jpg"),
        )
      ],
    );
  }

  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );

    if (_pickerDate != null) {
      setState(() {
        selectedDate = _pickerDate;
      });
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker(isStartTime: isStartTime);
    if (pickedTime != null) {
      String _formatedTime = pickedTime.format(context);
      print(_formatedTime);
      if (isStartTime) {
        setState(() {
          startTime = _formatedTime;
        });
      } else {
        setState(() {
          endTime = _formatedTime;
        });
      }
    }
  }

  _showTimePicker({required bool isStartTime}) {
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay(
        hour: isStartTime
            ? int.parse(startTime.split(":")[0])
            : int.parse(endTime.split(":")[0]),
        minute: isStartTime
            ? int.parse(startTime.split(":")[1].split(" ")[0])
            : int.parse(endTime.split(":")[1].split(" ")[0]),
      ),
    );
  }
}
