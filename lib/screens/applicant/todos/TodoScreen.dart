import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hirehub/controller/TodoController.dart';
import 'package:hirehub/models/todo.dart';
import 'package:hirehub/screens/applicant/todos/AddTodo.dart';
import 'package:hirehub/screens/widgets/Button.dart';
import 'package:hirehub/screens/widgets/TodoTile.dart';
import 'package:hirehub/theme/Theme.dart';
import 'package:intl/intl.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => TodoScreenState();
}

class TodoScreenState extends State<TodoScreen> {
  int selectedState = 0;
  final _eventController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          _addTaskBar(),
          _addDateBar(),
          const SizedBox(
            height: 20,
          ),
          _showEvents(),
        ],
      ),
    );
  }

  _showEvents() {
    return Expanded(child: Obx(() {
      return ListView.builder(
          itemCount: _eventController.todoList.length,
          itemBuilder: (_, index) {
            Todo event = _eventController.todoList[index];
            if (selectedState == event.isCompleted) {
              return AnimationConfiguration.staggeredList(
                position: index,
                child: SlideAnimation(
                  child: FadeInAnimation(
                    child: Row(children: [
                      GestureDetector(
                        onTap: () {
                          _showBottomSheet(context, event);
                        },
                        child: TodoTile(event),
                      )
                    ]),
                  ),
                ),
              );
            } else {
              return Container();
            }
          });
    }));
  }

  _showBottomSheet(BuildContext context, Todo event) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.only(top: 4),
        height: event.isCompleted == 1
            ? MediaQuery.of(context).size.height * 0.24
            : MediaQuery.of(context).size.height * 0.32,
        color: Get.isDarkMode ? darkGreyClr : Colors.white,
        child: Column(
          children: [
            Container(
              height: 6,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Get.isDarkMode ? Colors.grey[600] : Colors.grey[300]),
            ),
            const Spacer(),
            event.isCompleted == 1
                ? Container()
                : _bottomSheetButton(
                    label: "Task Completed",
                    context: context,
                    onTap: () {
                      print("Clicked");
                      _eventController.markTaskCompleted(event.id!);
                      print(event.isCompleted);
                      Get.back();
                    },
                    clr: primaryClr),
            _bottomSheetButton(
                label: "Delete Task",
                context: context,
                onTap: () {
                  _eventController.delete(event);
                  Get.back();
                },
                clr: Colors.red[300]!),
            const SizedBox(
              height: 20,
            ),
            _bottomSheetButton(
                label: "Close",
                context: context,
                isClose: true,
                onTap: () {
                  Get.back();
                },
                clr: Colors.transparent),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  _bottomSheetButton(
      {required String label,
      required Function()? onTap,
      required Color clr,
      required BuildContext context,
      bool isClose = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 55,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: isClose == true ? Colors.transparent : clr,
          border: Border.all(
            width: 2,
            color: isClose == true
                ? Get.isDarkMode
                    ? Colors.grey[600]!
                    : Colors.grey[200]!
                : clr,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  _addTaskBar() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMMd().format(DateTime.now()),
                  style: subHeadingStyle,
                ),
              ],
            ),
          ),
          MyButton(
              label: "+ Add Todo",
              onTap: () async {
                await Get.to(() => const AddTodoPage());
                _eventController.getTodos();
              })
        ],
      ),
    );
  }

  _addDateBar() {
    return Container(
        margin: const EdgeInsets.only(top: 20, left: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedState = 0;
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 7),
                decoration: BoxDecoration(
                  color:
                      selectedState == 0 ? Colors.orange : Colors.transparent,
                  border: Border.all(
                    color: selectedState == 0
                        ? Get.isDarkMode
                            ? Colors.grey[600]!
                            : Colors.grey[200]!
                        : Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Pending",
                  style: selectedState == 0
                      ? headingStyle.copyWith(
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        )
                      : headingStyle,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedState = 1;
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 7),
                decoration: BoxDecoration(
                  color: selectedState == 1 ? Colors.green : Colors.transparent,
                  border: Border.all(
                    color: selectedState == 1
                        ? Get.isDarkMode
                            ? Colors.grey[600]!
                            : Colors.grey[200]!
                        : Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Completed",
                  style: selectedState == 1
                      ? headingStyle.copyWith(
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        )
                      : headingStyle,
                ),
              ),
            ),
          ],
        ));
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
      title: Text(
        "My Todos",
        style: GoogleFonts.lato(
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
    );
  }
}
