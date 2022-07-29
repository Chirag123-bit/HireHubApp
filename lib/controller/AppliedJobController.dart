import 'package:get/get.dart';
import 'package:hirehub/database/JobHelper.dart';
import 'package:hirehub/models/jobModels/AppliedJobs.dart';
import 'package:hirehub/repository/job_repository.dart';

class JobController extends GetxController {
  @override
  void onReady() {
    print("Hre");
    super.onReady();
    getAppliedJobs();
  }

  var appliedJobsList = <AppliedJob>[].obs;

  Future<int> addAppliedJob({AppliedJob? appliedJob}) async {
    return await JobHelper.insert(appliedJob!);
  }

  //get all events form database
  getAppliedJobs() async {
    final JobsRepository _jobRepository = JobsRepository();
    final appldJobs = await _jobRepository.getAppliedJobs();
    final appliedJobs = appldJobs?.data;
    if (appliedJobs != null) {
      deleteAll();
      for (var data in appliedJobs) {
        addAppliedJob(appliedJob: data);
      }
    }
    List<Map<String, dynamic>> events = await JobHelper.query();
    print("events: $events");
    appliedJobsList.assignAll(
        events.map((data) => AppliedJob.fromJsonTable(data)).toList());

    return appliedJobsList;
  }

  void delete(AppliedJob appliedJob) {
    appliedJobsList.remove(appliedJob);
    var val = JobHelper.delete(appliedJob);
  }

  void deleteAll() {
    appliedJobsList.clear();
    var val = JobHelper.deleteAll();
  }

  void markTaskCompleted(int id, String status) async {
    var val = await JobHelper.update(id, status);
    getAppliedJobs();
  }

  void resetTable() async {
    await JobHelper.deleteAll();
    setAppliedJobs();
  }

  void setAppliedJobs() async {
    final JobsRepository _jobRepository = JobsRepository();
    final appldJobs = await _jobRepository.getAppliedJobs();
    final appliedJobs = appldJobs?.data;

    //store appliedJobs in sqlite db
    if (appliedJobs != null) {
      JobController _jobHelper = JobController();
      for (var data in appliedJobs) {
        _jobHelper.addAppliedJob(appliedJob: data);
      }
    }
  }
}
