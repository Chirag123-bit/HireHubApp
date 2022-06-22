import 'package:get/get.dart';
import 'package:hirehub/database/DbHelper.dart';
import 'package:hirehub/models/Events.dart';

class EventController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    getEvents();
  }

  var eventList = <Event>[].obs;

  Future<int> addEvent({Event? event}) async {
    return await DbHelper.insert(event!);
  }

  //get all events form database
  void getEvents() async {
    List<Map<String, dynamic>> events = await DbHelper.query();
    eventList.assignAll(events.map((data) => Event.fromJson(data)).toList());
    print(eventList.length);
  }

  void delete(Event event) {
    eventList.remove(event);
    var val = DbHelper.delete(event);
  }

  void markTaskCompleted(int id) async {
    var val = await DbHelper.update(id);
    getEvents();
  }
}
