import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirehub/controller/TodoController.dart';
import 'package:hirehub/models/todo.dart';
import 'package:hirehub/screens/widgets/Button.dart';
import 'package:hirehub/screens/widgets/InputField.dart';
import 'package:hirehub/theme/Theme.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({Key? key}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final TodoController _eventController = Get.put(TodoController());
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
              Text("Add Todo", style: headingStyle),
              MyInputField(
                  hint: "Enter Your title",
                  title: "Title",
                  controller: _titleController),
              MyInputField(
                hint: "Enter Your Note",
                title: "Note",
                controller: _noteController,
              ),
              const SizedBox(
                height: 20,
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
      event: Todo(
        title: _titleController.text,
        note: _noteController.text,
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
}
