import 'package:get/get.dart';
import 'package:hirehub/database/TodoHelper.dart';
import 'package:hirehub/models/todo.dart';

class TodoController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    getTodos();
  }

  var todoList = <Todo>[].obs;

  Future<int> addEvent({Todo? event}) async {
    return await TodoHelper.insert(event!);
  }

  //get all events form database
  void getTodos() async {
    List<Map<String, dynamic>> events = await TodoHelper.query();
    todoList.assignAll(events.map((data) => Todo.fromJson(data)).toList());
    print(todoList.length);
  }

  void delete(Todo event) {
    todoList.remove(event);
    var val = TodoHelper.delete(event);
  }

  void markTaskCompleted(int id) async {
    var val = await TodoHelper.update(id);
    getTodos();
  }
}
