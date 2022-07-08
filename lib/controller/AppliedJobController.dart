import 'package:get/get.dart';
import 'package:hirehub/database/JobHelper.dart';
import 'package:hirehub/models/jobModels/AppliedJobs.dart';

class JobController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    getTodos();
  }

  var appliedJobsList = <AppliedJob>[].obs;

  Future<int> addAppliedJob({AppliedJob? appliedJob}) async {
    return await JobHelper.insert(appliedJob!);
  }

  //get all events form database
  void getTodos() async {
    List<Map<String, dynamic>> events = await JobHelper.query();
    appliedJobsList
        .assignAll(events.map((data) => AppliedJob.fromJson(data)).toList());
    print(appliedJobsList.length);
  }

  void delete(AppliedJob appliedJob) {
    appliedJobsList.remove(appliedJob);
    var val = JobHelper.delete(appliedJob);
  }

  void markTaskCompleted(int id, String status) async {
    var val = await JobHelper.update(id, status);
    getTodos();
  }
}
